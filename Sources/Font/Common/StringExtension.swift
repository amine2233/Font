import Foundation

/// A Font extension to String.
extension String {
    
    /// Get String located by name of font convertible
    ///
    /// - Parameter code: String of name of picture in font
    /// - Returns: String location name picture in font
    public static func fontConvertible(with code: String) -> String {
        return String(code[..<code.index(code.startIndex, offsetBy: 1)])
    }

    /// Get a FontFamily icon string with the given icon name.
    ///
    /// - parameter name: The preferred icon name.
    /// - returns: A string that will appear as icon with FontFamily.
    public static func fontIcon<T: FontFamily>(name: T) -> String {
        let toIndex = name.unicode.index(name.unicode.startIndex, offsetBy: 1)
        return String(name.unicode[name.unicode.startIndex..<toIndex])
    }

    /// Get a FontFamily icon string with the given CSS icon code.
    ///
    /// - parameter type: The `FontFamily` icon type.
    /// - parameter code: The preferred icon name.
    /// - returns: A string that will appear as icon with FontFamily.
    static func fontFontFamilyIcon<T: FontFamily>(type: T.Type, code: String) -> String? where T.RawValue == String {
        guard let name = font(type: type, code: code) else {
            return nil
        }

        return fontIcon(name: name)
    }

    /// Get a FontFamily icon with the given CSS icon code.
    ///
    /// - parameter type: The `FontFamily` icon type.
    /// - parameter code: The preferred icon name.
    /// - returns: An internal corresponding FontFamily code.
    public static func font<T: FontFamily>(type: T.Type, code: String) -> T? where T.RawValue == String {
        return type.init(rawValue: code)
    }

    /// Get a FontFamily icon with the given CSS icon code.
    ///
    /// - parameter code: The preferred icon name.
    /// - returns: An internal corresponding FontFamily code.
    public func font<T: FontFamily>(type: T.Type) -> T? where T.RawValue == String {
        return T(rawValue: self)
    }
}
