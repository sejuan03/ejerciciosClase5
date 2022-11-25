import UIKit

public extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Self {
        let divisor = Self(Int(pow(10.0, Double(places))))
        return (self * divisor).rounded() / divisor
    }
}
