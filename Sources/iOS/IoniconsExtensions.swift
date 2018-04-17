import Foundation
import UIKit

/// A Ionicons extension to UIImage.
public extension UIImage {
    /// Get a Ionicons image with the given icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImage that will appear as icon with Ionicons
    public static func ionicon(with name: Ionicons, textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontSize = min(size.width, size.height)
        let fontsAttributes = [NSAttributedStringKey.font: Font(font: FontFamily.Ionicons.medium, size: fontSize), NSAttributedStringKey.foregroundColor: textColor, NSAttributedStringKey.backgroundColor: backgroundColor, NSAttributedStringKey.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: String.ionicon(with: name), attributes: fontsAttributes)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
