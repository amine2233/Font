#if os(OSX)
    import AppKit.NSFont
    public typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIFont
    public typealias Font = UIFont
#endif

public struct FontConvertible: Hashable, Equatable {
    /// The name of `FontConvertible
    public let name: String
    /// The family name of `FontConvertible`
    public let family: String
    /// The file name of `FontConvertible
    public let fileName: String
    /// The ratio of `FontConvertible
    public let ratio: Float
    /// The file extension of `FontConvertible`
    public let extensions = ["otf", "ttf"]

    /// Register and then get the new `Font`
    public func font(size: CGFloat) -> Font? {
        return Font(font: self, size: size)
    }

    /// Register font
    func register() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }

    /// Unregister font
    func unregister() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerUnregisterFontsForURL(url as CFURL, .process, &errorRef)
    }

    /// The path url of `Font`
    fileprivate var url: URL? {
        let bundle = Bundle(for: BundleToken.self)
        guard let url = extensions.compactMap({ bundle.url(forResource: fileName, withExtension: $0) }).first else { return nil }
        return url
    }
}

extension Font {
    /// Create new icon font
    ///
    /// - Parameter font: The Icon Font
    /// - Parameter size: The Size of icon
    /// - returns: new `Font`
    public convenience init!(font: FontConvertible, size: CGFloat) {
        #if os(iOS) || os(tvOS) || os(watchOS)
            if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
                font.register()
            }
        #elseif os(OSX)
            if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
                font.register()
            }
        #endif

        self.init(name: font.name, size: size)
    }
    
    
    /// Unregister font convertible
    ///
    /// - Parameter font: FontConvertible it will be unregistred
    public static func unregister(font: FontConvertible) {
        #if os(iOS) || os(tvOS) || os(watchOS)
        if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
            font.unregister()
        }
        #elseif os(OSX)
        if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
            font.unregister()
        }
        #endif
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
    /// Create new icon font
    ///
    /// - Parameter textStyle: The text Font style
    /// - Parameter icon: The Font icon
    /// - returns: new `Font`
    public static func font(forTextStyle textStyle: Font.TextStyle, font: FontConvertible) -> Font? {
        let userFont = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let pointSize = userFont.pointSize

        guard let convertibleFont = font.font(size: pointSize) else { return nil }

        if #available(iOS 11.0, *), #available(watchOSApplicationExtension 4.0, *), #available(tvOS 11.0, *) {
            return UIFontMetrics.default.scaledFont(for: convertibleFont)
        } else {
            let scale = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).pointSize / 17
            return convertibleFont.withSize(scale * convertibleFont.pointSize)
        }
    }
    #endif
}

/// The `FontFamily` protocol
public protocol FontFamily: RawRepresentable {
    /// The name of icon
    var name: String { get }
    /// The unicode of icon `\u{...}`
    var unicode: String { get }
    /// The `FontConvertible`
    static var fontConvertible: FontConvertible { get }
}

extension FontFamily where Self: RawRepresentable, Self.RawValue == String {
    public var name: String {
        return rawValue
    }
}

extension FontFamily where Self: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name &&
            lhs.unicode == rhs.unicode
    }
}

extension FontFamily where Self: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(unicode)
    }
}

extension RawRepresentable where RawValue == String, Self: FontFamily {
    public var name: String {
        return self.rawValue
    }
}

private final class BundleToken {}
