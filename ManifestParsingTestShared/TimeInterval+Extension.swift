import Foundation

extension TimeInterval {
    func rounded(decimals: Int) -> Double {
        (self * pow(10, Double(decimals))).rounded() / pow(10, Double(decimals))
    }
}
