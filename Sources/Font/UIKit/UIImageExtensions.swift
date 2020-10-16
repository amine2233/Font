import CommonFont
#if canImport(UIKit)
import UIKit

#if !os(watchOS)
/// A Ionicons extension to UIImage.
extension UIImage {
    
    /// Get a FontFamily image with the given FontFamily icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    public static func fontIcon<T: FontFamily>(_ value: T,
                                               textColor: UIColor,
                                               size: CGSize,
                                               backgroundColor: UIColor = .clear,
                                               borderWidth: CGFloat = 0,
                                               borderColor: UIColor = UIColor.clear) -> UIImage? {
        return UIImage.fontConfigure(T.fontConvertible, name: value.unicode, textColor: textColor, size: size, backgroundColor: backgroundColor, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    /// Get a Font image with the given font type and name, text color, size and an optional background color.
    ///
    /// - parameter font: The preferred font.
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with FontAwesome
    private static func fontConfigure(_ font: FontConvertible,
                                      name: String,
                                      textColor: UIColor,
                                      size: CGSize,
                                      backgroundColor: UIColor,
                                      borderWidth: CGFloat = 0,
                                      borderColor: UIColor = UIColor.clear) -> UIImage? {

        var size = size
        if size.width <= 0 { size.width = 1 }
        if size.height <= 0 { size.height = 1 }

        let fontSize = min(size.width / CGFloat(font.ratio), size.height)
        guard let font = Font(font: font, size: fontSize) else { return nil }

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center

        let strokeWidth: CGFloat = fontSize == 0 ? 0 : (-100 * borderWidth / fontSize)

        let fontsAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.backgroundColor: backgroundColor,
            NSAttributedString.Key.paragraphStyle: paragraph,
            NSAttributedString.Key.strokeWidth: strokeWidth,
            NSAttributedString.Key.strokeColor: borderColor]

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
