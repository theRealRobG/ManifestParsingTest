import Foundation
import AVFoundation

protocol ResourceLoaderDelegate: AnyObject {
    func resourceLoaderDidStartDispatchGlobal(_ resourceLoader: ResourceLoader)
    func resourceLoaderDidCompleteDispatchGlobal(_ resourceLoader: ResourceLoader)
}

class ResourceLoader: NSObject, AVAssetResourceLoaderDelegate {
    weak var delegate: ResourceLoaderDelegate?

    private let testURL: URL
    private let loadingStrategy: LoadingStrategy
    private let loaderQueue = DispatchQueue(label: "asset-loader-queue", qos: .userInteractive)

    init(testURL: URL, loadingStrategy: LoadingStrategy) {
        self.testURL = testURL
        self.loadingStrategy = loadingStrategy
    }

    func resourceLoader(
        _ resourceLoader: AVAssetResourceLoader,
        shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest
    ) -> Bool {
        if loadingRequest.request.url?.scheme == "xxx" {
            delegate?.resourceLoaderDidStartDispatchGlobal(self)
            loaderQueue.async { [weak self] in
                self.map { $0.delegate?.resourceLoaderDidCompleteDispatchGlobal($0) }
                loadingRequest.dataRequest?.respond(with: ManifestData.mediaPlaylistData)
                loadingRequest.finishLoading()
            }
            return true
        }
        guard loadingRequest.request.url?.host == testURL.host else {
            loaderQueue.async {
                loadingRequest.finishLoading(with: LoadingFailure.unexpectedURL)
            }
            return true
        }
        delegate?.resourceLoaderDidStartDispatchGlobal(self)
        loaderQueue.async { [weak self] in
            self.map { $0.delegate?.resourceLoaderDidCompleteDispatchGlobal($0) }
            switch self?.loadingStrategy {
            case .longManifest, .none:
                loadingRequest.dataRequest?.respond(with: ManifestData.longManifestData)
            case .shortManifest:
                loadingRequest.dataRequest?.respond(with: ManifestData.shortManifestData)
            }
            loadingRequest.finishLoading()
        }
        return true
    }
}

extension ResourceLoader {
    enum LoadingStrategy {
        case longManifest
        case shortManifest
    }
}
