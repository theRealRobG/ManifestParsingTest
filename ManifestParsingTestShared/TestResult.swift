import Foundation

struct TestResult {
    let longManifestParsingTime: TimeInterval
    let shortManifestParsingTime: TimeInterval
    let testMagnitude: Int
    var difference: TimeInterval { longManifestParsingTime - shortManifestParsingTime }
    var averageDifference: TimeInterval { difference / TimeInterval(testMagnitude) }

    var formattedMessage: String {
        let line1 = "Long: \(longManifestParsingTime.rounded(decimals: 5))"
        let line2 = "Short: \(shortManifestParsingTime.rounded(decimals: 5))"
        let line3 = "Avg. Diff: \(averageDifference.rounded(decimals: 5))"
        return "\(line1)\n\(line2)\n\(line3)"
    }
}
