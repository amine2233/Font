#if os(OSX)
import AppKit.NSFont
typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIFont
typealias Font = UIFont
#endif

struct FontConvertible {
    let name: String
    let family: String
    let path: String
    let extensions = ["otf", "ttf"]
    
    func font(size: CGFloat) -> Font! {
        return Font(font: self, size: size)
    }
    
    func register() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }
    
    fileprivate var url: URL? {
        let bundle = Bundle(for: BundleToken.self)
        guard let url = extensions.compactMap({ bundle.url(forResource: path, withExtension: $0) }).first else { return nil }
        return url
        //return bundle.url(forResource: path, withExtension: nil)
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
}

protocol IconProtocol {
    static var medium: FontConvertible { get }
}

enum FontFamily {
    enum Ionicons: IconProtocol {
        static let medium = FontConvertible(name: "Ionicons", family: "Ionicons", path: "ionicons")
    }
    enum FontAwesome: IconProtocol {
        static let medium = FontConvertible(name: "FontAwesome", family: "FontAwesome", path: "fontawesome-webfont")
    }
}

private final class BundleToken {}
