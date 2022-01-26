import Foundation
import AVFoundation

struct LoadingFailure: CustomNSError {
    static let errorDomain = "LoadingFailureErrorDomain"
    static var noMetadata: LoadingFailure {
        LoadingFailure(code: 6, message: "Asset did not contain expected metadata")
    }
    static var unexpectedURL: LoadingFailure {
        LoadingFailure(code: 7, message: "Asset loaded unexpected URL")
    }

    var errorCode: Int { code }
    var errorUserInfo: [String: Any] { userInfo }

    private let code: Int
    private let userInfo: [String: Any]

    init?(keyValueStatus: AVKeyValueStatus, error: NSError?) {
        if let error = error {
            code = 0
            userInfo = [NSUnderlyingErrorKey: error]
        } else {
            switch keyValueStatus {
            case .loaded:
                return nil
            case .unknown:
                code = 1
                userInfo = [NSLocalizedDescriptionKey: "Asset finished loading with unknown status"]
            case .loading:
                code = 2
                userInfo = [NSLocalizedDescriptionKey: "Asset finished loading with loading status"]
            case .failed:
                code = 3
                userInfo = [NSLocalizedDescriptionKey: "Asset finished loading with failed status"]
            case .cancelled:
                code = 4
                userInfo = [NSLocalizedDescriptionKey: "Asset finished loading with cancelled status"]
            @unknown default:
                code = 5
                userInfo = [NSLocalizedDescriptionKey: "Asset finished loading with @unknown default status"]
            }
        }
    }

    private init(code: Int, message: String) {
        self.code = code
        self.userInfo = [NSLocalizedDescriptionKey: message]
    }
}
