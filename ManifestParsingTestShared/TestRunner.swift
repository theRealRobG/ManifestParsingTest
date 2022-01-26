import Foundation
import AVFoundation

class TestRunner {
    private let testMagnitude: Int
    private let testURL: URL
    private let resourceLoader: ResourceLoader
    private let loaderQueue = DispatchQueue(label: "loader-queue", qos: .userInteractive)

    private var isRunInProgress = false
    private var upTimeAtDispatchStart: TimeInterval?
    private var upTimeWaitingForDispatchQueue = 0.0

    /// A runner for the manifest parsing duration test
    /// - Parameter testMagnitude: The number of times the parsing should be repeated
    init(testMagnitude: Int) {
        guard testMagnitude > 0 else { fatalError("Magnitude must be greater than 0") }
        self.testMagnitude = testMagnitude
        testURL = URL(string: "testscheme://fake.manifest/multivariant.m3u8")!
        resourceLoader = ResourceLoader(testURL: testURL)
        resourceLoader.delegate = self
    }

    /// Run a manifest parsing test using the pre-configured test magnitude
    /// - Parameter completion: Provides the duration for all parses to complete, otherwise an error
    func run(completion: @escaping (Result<TimeInterval, Error>) -> Void) {
        guard !isRunInProgress else { fatalError("Cannot run more than one test at a time") }
        isRunInProgress = true
        let info = ProcessInfo.processInfo
        let start = info.systemUptime
        test(number: testMagnitude) { result in
            self.isRunInProgress = false
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success:
                let end = info.systemUptime
                completion(.success(end - (start + self.upTimeWaitingForDispatchQueue)))
            }
        }
    }

    private func test(number: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        guard number != 0 else { return completion(.success(())) }
        unitTest { result in
            switch result {
            case .success: self.test(number: number - 1, completion: completion)
            case .failure(let error): completion(.failure(error))
            }
        }
    }

    private func unitTest(completion: @escaping (Result<Void, Error>) -> Void) {
        let asset = AVURLAsset(url: testURL)
        asset.resourceLoader.setDelegate(resourceLoader, queue: loaderQueue)
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

extension TestRunner: ResourceLoaderDelegate {
    func resourceLoaderDidStartDispatchGlobal() {
        guard upTimeAtDispatchStart == nil else { fatalError("Unexpected concurrent queue access") }
        upTimeAtDispatchStart = ProcessInfo.processInfo.systemUptime
    }

    func resourceLoaderDidCompleteDispatchGlobal() {
        guard let upTimeBeforeDispatch = upTimeAtDispatchStart else { fatalError("Unexpected concurrent queue access") }
        upTimeWaitingForDispatchQueue += (ProcessInfo.processInfo.systemUptime - upTimeBeforeDispatch)
        upTimeAtDispatchStart = nil
    }
}
