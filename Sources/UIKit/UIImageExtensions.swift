#if canImport(UIKit)
import UIKit

#if !os(watchOS)
/// A Ionicons extension to UIImage.
extension UIImage {
    
    /// Get a FontAwesome image with the given FontAwesome icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    public static func fontIcon<T: FontFamily>(_ value: T, textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage? {
        return UIImage.fontConfigure(T.regularFont, name: value.name, textColor: textColor, size: size, backgroundColor: backgroundColor)
    }
    
    /// Get a Font image with the given font type and name, text color, size and an optional background color.
    ///
    /// - parameter font: The preferred font.
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    private static func fontConfigure(_ font: FontConvertible, name: String, textColor: UIColor, size: CGSize, backgroundColor: UIColor) -> UIImage? {
        let fontSize = min(size.width, size.height)
        guard let font = Font(font: font, size: fontSize) else { return nil }
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontsAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: backgroundColor, NSAttributedString.Key.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: name, attributes: fontsAttributes)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif

#endif
