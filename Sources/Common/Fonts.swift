#if os(OSX)
    import AppKit.NSFont
    public typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIFont
    public typealias Font = UIFont
#endif

public struct FontConvertible: Hashable, Equatable {
    public let name: String
    public let family: String
    public let path: String
    public let ratio: Float
    public let extensions = ["otf", "ttf"]

    public func font(size: CGFloat) -> Font! {
        return Font(font: self, size: size)
    }

    func register() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }
    
    func unregister() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerUnregisterFontsForURL(url as CFURL, .process, &errorRef)
    }

    fileprivate var url: URL? {
        let bundle = Bundle(for: BundleToken.self)
        guard let url = extensions.compactMap({ bundle.url(forResource: path, withExtension: $0) }).first else { return nil }
        return url
    }
}

extension Font {
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

public enum FontStyle: String, CaseIterable {
    case solid
    case light
    case regular
    case brands
}

public protocol FontFamily: RawRepresentable {
    var name: String { get }
    var unicode: String { get }
    static var fontDetail: FontConvertible { get }
}

extension FontFamily where Self: RawRepresentable, Self.RawValue == String {

    public var name: String {
        return rawValue
    }
}

extension FontFamily where Self: Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name
    }
}

extension FontFamily where Self: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension RawRepresentable where RawValue == String, Self: FontFamily {
    public var name: String {
        return self.rawValue
    }
}

private final class BundleToken {}
