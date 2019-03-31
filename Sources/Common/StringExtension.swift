import Foundation

/// A Font extension to String.
extension String {
    
    /// Get String located by name of font convertible
    ///
    /// - Parameter name: String of name of picture in font
    /// - Returns: String location name picture in font
    public static func fontConvertible(with name: String) -> String {
        return String(name[..<name.index(name.startIndex, offsetBy: 1)])
    }
}
