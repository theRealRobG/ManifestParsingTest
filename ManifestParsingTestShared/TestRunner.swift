import Foundation
import AVFoundation

class TestRunner {
    private let testMagnitude: Int
    private let longManifestURL: URL
    private let longManifestResourceLoader: ResourceLoader
    private let longManifestDispatchTimeCalculator: DispatchTimeCalculator
    private let shortManifestURL: URL
    private let shortManifestResourceLoader: ResourceLoader
    private let shortManifestDispatchTimeCalculator: DispatchTimeCalculator
    private let loaderQueue = DispatchQueue(label: "loader-queue", qos: .userInteractive)
    private var isRunInProgress = false

    /// A runner for the manifest parsing duration test
    /// - Parameter testMagnitude: The number of times the parsing should be repeated
    init(testMagnitude: Int) {
        guard testMagnitude > 0 else { fatalError("Magnitude must be greater than 0") }
        self.testMagnitude = testMagnitude
        longManifestURL = URL(string: "testscheme://fake.manifest/long/multivariant.m3u8")!
        longManifestResourceLoader = ResourceLoader(
            testURL: longManifestURL,
            loadingStrategy: .longManifest
        )
        longManifestDispatchTimeCalculator = DispatchTimeCalculator()
        longManifestResourceLoader.delegate = longManifestDispatchTimeCalculator
        shortManifestURL = URL(string: "testscheme://fake.manifest/short/multivariant.m3u8")!
        shortManifestResourceLoader = ResourceLoader(
            testURL: shortManifestURL,
            loadingStrategy: .shortManifest
        )
        shortManifestDispatchTimeCalculator = DispatchTimeCalculator()
        shortManifestResourceLoader.delegate = shortManifestDispatchTimeCalculator
    }

    /// Run a manifest parsing test using the pre-configured test magnitude
    /// - Parameter completion: Provides the duration for all parses to complete, otherwise an error
    func run(completion: @escaping (Result<TestResult, Error>) -> Void) {
        guard !isRunInProgress else { fatalError("Cannot run more than one test at a time") }
        isRunInProgress = true
        let info = ProcessInfo.processInfo
        let start = info.systemUptime
        test(strategy: .longManifest, number: testMagnitude) { result in
            self.isRunInProgress = false
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success:
                let endLong = info.systemUptime
                self.test(strategy: .shortManifest, number: self.testMagnitude) { result in
                    switch result {
                    case .failure(let error): completion(.failure(error))
                    case .success:
                        let endShort = info.systemUptime
                        let longDispatchTime = self.longManifestDispatchTimeCalculator.totalDispatchTime
                        let longParsingDuration = (endLong - start) - longDispatchTime
                        let shortDispatchTime = self.shortManifestDispatchTimeCalculator.totalDispatchTime
                        let shortParsingDuration = (endShort - endLong) - shortDispatchTime
                        let result = TestResult(
                            longManifestParsingTime: longParsingDuration,
                            shortManifestParsingTime: shortParsingDuration,
                            testMagnitude: self.testMagnitude
                        )
                        completion(.success(result))
                    }
                }
            }
        }
    }

    private func test(
        strategy: ResourceLoader.LoadingStrategy,
        number: Int,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        guard number != 0 else { return completion(.success(())) }
        unitTest(strategy: strategy) { result in
            switch result {
            case .success: self.test(strategy: strategy, number: number - 1, completion: completion)
            case .failure(let error): completion(.failure(error))
            }
        }
    }

    private func unitTest(
        strategy: ResourceLoader.LoadingStrategy,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let url: URL
        switch strategy {
        case .longManifest: url = longManifestURL
        case .shortManifest: url = shortManifestURL
        }
        let asset = AVURLAsset(url: url.appendingPathComponent(UUID().uuidString))
        asset.resourceLoader.setDelegate(longManifestResourceLoader, queue: loaderQueue)
        asset.loadValuesAsynchronously(forKeys: [#keyPath(AVAsset.metadata)]) {
            var metadataError: NSError?
            let status = asset.statusOfValue(forKey: #keyPath(AVAsset.metadata), error: &metadataError)
            if let error = LoadingFailure(keyValueStatus: status, error: metadataError) {
                return completion(.failure(error))
            }
            let metadata = asset.metadata
            let expectedItems = AVMetadataItem.metadataItems(
                from: metadata,
                filteredByIdentifier: AVMetadataIdentifier(rawValue: "mdta/manifest.parsing.test.id")
            )
            if expectedItems.first?.stringValue == "expected" {
                completion(.success(()))
            } else {
                completion(.failure(LoadingFailure.noMetadata))
            }
        }
    }
}

private class DispatchTimeCalculator: ResourceLoaderDelegate {
    var totalDispatchTime: TimeInterval { upTimeWaitingForDispatchQueue }

    private var upTimeAtDispatchStart: TimeInterval?
    private var upTimeWaitingForDispatchQueue = 0.0

    func resourceLoaderDidStartDispatchGlobal(_ resourceLoader: ResourceLoader) {
        guard upTimeAtDispatchStart == nil else { fatalError("Unexpected concurrent queue access") }
        upTimeAtDispatchStart = ProcessInfo.processInfo.systemUptime
    }

    func resourceLoaderDidCompleteDispatchGlobal(_ resourceLoader: ResourceLoader) {
        guard let upTimeBeforeDispatch = upTimeAtDispatchStart else { fatalError("Unexpected concurrent queue access") }
        upTimeWaitingForDispatchQueue += (ProcessInfo.processInfo.systemUptime - upTimeBeforeDispatch)
        upTimeAtDispatchStart = nil
    }
}
