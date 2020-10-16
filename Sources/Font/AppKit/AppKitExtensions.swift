import CommonFont
#if canImport(Cocoa)
import Cocoa

#if os(macOS)
extension NSImageView {
    
    /// Initializes a new item using the specified `FontFamily` icon and other properties.
    ///
    /// - parameter icon: The preferred `FontFamily` icon name.
    /// - parameter size: The image size.
    /// - parameter color: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    public convenience init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor = NSColor.darkGray) {
        guard let image = NSImage.font(icon, textColor: color, size: size) else { return nil }
        self.init(image: image)
    }
    
    /**
     Sets the `FontFamily` icon to use for the specified image view.
     - parameter icon: The `FontFamily` icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    public func setImage<T: FontFamily>(_ icon: T, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.font(icon, textColor: color, size: size ?? frame.size)
    }
}

extension NSButton {
    
    /// Initializes a new item using the specified `FontFamily` icon and other properties.
    ///
    /// - parameter icon: The preferred Ionicons icon name.
    /// - parameter size: The image size.
    /// - parameter color: The background color (optional).
    /// - parameter target: The target (optional).
    /// - parameter action: The action (optional).
    /// - returns: A NSButton that will appear as icon with FontFamilys
    public convenience init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        guard let image = NSImage.font(icon, textColor: color, size: size) else { return nil }
        self.init(image: image, target: target, action: action)
    }
    
    /**
     Sets the `FontFamily` icon.
     - parameter icon: The `FontFamily` icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    public func setImage<T: FontFamily>(_ icon: T, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.font(icon, textColor: color, size: size ?? frame.size)
    }
}

extension NSToolbarItem {
    /**
     Sets the `FontFamily` icon.
     - parameter icon: The `FontFamily` icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    public func setImage<T: FontFamily>(_ icon: T, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.font(icon, textColor: color, size: size ?? minSize)
    }
}
#endif
#endif
