#if canImport(Cocoa)
import Cocoa

#if os(macOS)
extension NSImage {
    
    /// Get a FontAwesome image with the given FontAwesome icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred FontAwesome icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - parameter edgeInsets: The position of icon (optional).
    /// - returns: A UIImage that will appear as icon with Ionicons
    public static func font<T: FontFamily>(_ font: T, textColor: NSColor, size: CGSize, backgroundColor: NSColor = NSColor.clear, edgeInsets: NSEdgeInsets = NSEdgeInsetsZero) -> NSImage? {
        return NSImage.fontConfigure(T.fontDetail, with: String.fontConvertible(with: font.name), size: size, textColor: textColor, backgroundColor: backgroundColor, edgeInsets: edgeInsets)
    }
    
    
    /// Create image with FontConvertible
    ///
    /// - Parameters:
    ///   - font: FontConvertible type
    ///   - name: String name of picture
    ///   - size: CGSize of result picture
    ///   - textColor: NSColor Color of result picture
    ///   - backgroundColor: NSColor Background Color of result picture
    ///   - edgeInsets: NSEdgeInsets of result picture
    /// - Returns: NSImage located by name in font
    private static func fontConfigure(_ font: FontConvertible, with name: String, size: CGSize, textColor: NSColor, backgroundColor: NSColor, edgeInsets: NSEdgeInsets) -> NSImage?
    {
        let fontSize = min(size.width, size.height)
        guard let font = font.font(size: fontSize) else { return nil }
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontsAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: backgroundColor, NSAttributedString.Key.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: name, attributes: fontsAttributes)
        
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        rect.origin.y -= edgeInsets.top
        rect.size.width -= edgeInsets.left + edgeInsets.right
        rect.size.height -= edgeInsets.top + edgeInsets.bottom
        
        let rep = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(size.width),
            pixelsHigh: Int(size.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: NSColorSpaceName.calibratedRGB,
            bytesPerRow: 0,
            bitsPerPixel: 0)
        
        guard  let repo = rep else { return nil }
        
        let context = NSGraphicsContext(bitmapImageRep: repo)
        
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = context
        
        attributedString.draw(in: rect)
        
        NSGraphicsContext.restoreGraphicsState()
        
        let image = NSImage(size: size)
        image.addRepresentation(rep!)
        
        return image
    }
}
#endif
#endif
