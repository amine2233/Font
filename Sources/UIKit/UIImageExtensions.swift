#if canImport(UIKit)
import UIKit

#if !os(watchOS)
/// A Ionicons extension to UIImage.
extension UIImage {
    /// Get a Ionicons image with the given Ionicons icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with Ionicons
    public static func ionicon(with name: Ionicons, textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage {
        return UIImage.fontConfigure(Ionicons.regularFont, with: name.rawValue, textColor: textColor, size: size, backgroundColor: backgroundColor)
    }

    /// Get a FontAwesome image with the given FontAwesome icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    public static func fontAwesome(with name: FontAwesome,textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage {
        return UIImage.fontConfigure(FontAwesome.regularFont, with: name.rawValue, textColor: textColor, size: size, backgroundColor: backgroundColor)
    }
    
    /// Get a Font image with the given font type and name, text color, size and an optional background color.
    ///
    /// - parameter font: The preferred font.
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    private static func fontConfigure(_ font: FontConvertible, with name: String, textColor: UIColor, size: CGSize, backgroundColor: UIColor) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontSize = min(size.width, size.height)
        let fontsAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: Font(font: font, size: fontSize)!, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: backgroundColor, NSAttributedString.Key.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: name, attributes: fontsAttributes)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
#endif

#endif
