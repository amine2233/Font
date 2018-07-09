#if os(OSX)
    import AppKit.NSFont
    typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIFont
    typealias Font = UIFont
#endif

public struct FontConvertible {
    public let name: String
    public let family: String
    public let path: String
    public let extensions = ["otf", "ttf"]

    func font(size: CGFloat) -> Font! {
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
    convenience init!(font: FontConvertible, size: CGFloat) {
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
    static func unregister(font: FontConvertible) {
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
}

public protocol FontFamily {
    static var regularFont: FontConvertible { get }
}

private final class BundleToken {}
