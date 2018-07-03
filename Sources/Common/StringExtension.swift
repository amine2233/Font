import Foundation

/// A Ionicons extension to String.
public extension String {
    
    /// Get a Ionicons icon string with the given icon name.
    ///
    /// - parameter name: The preferred icon name.
    /// - returns: A string that will appear as icon with Ionicons.
    public static func ionicon(with name: Ionicons) -> String {
        return String(name.rawValue[..<name.rawValue.index(name.rawValue.startIndex, offsetBy: 1)])
    }
    
    public static func fontAwesome(with name: FontAwesome) -> String {
        return String(name.rawValue[..<name.rawValue.index(name.rawValue.startIndex, offsetBy: 1)])
    }
}
