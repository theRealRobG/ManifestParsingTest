import Foundation

struct TestResult {
    let longManifestParsingTime: TimeInterval
    let shortManifestParsingTime: TimeInterval
    let testMagnitude: Int
    var difference: TimeInterval { longManifestParsingTime - shortManifestParsingTime }
    var averageDifference: TimeInterval { difference / TimeInterval(testMagnitude) }
}
