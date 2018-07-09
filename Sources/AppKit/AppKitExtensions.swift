#if canImport(Cocoa)
import Cocoa

extension NSImageView {
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    convenience init(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray) {
        self.init(image: NSImage.ionicon(with: icon, textColor: color, size: size))
    }

    /**
     Sets the Ionicons icon to use for the specified image view.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.ionicon(with: icon, textColor: color, size: size ?? frame.size)
    }
    
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    convenience init(withIcon icon: FontAwesome, size: CGSize, color: NSColor = NSColor.darkGray) {
        self.init(image: NSImage.fontAwesome(with: icon, textColor: color, size: size))
    }
    
    /**
     Sets the FontAwesome icon to use for the specified image view.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    func setImage(withIcon icon: FontAwesome, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.fontAwesome(with: icon, textColor: color, size: size ?? frame.size)
    }
}

extension NSButton {
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A NSButton that will appear as icon with Ionicons
    convenience init(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        self.init(image: NSImage.ionicon(with: icon, textColor: color, size: size), target: target, action: action)
    }

    /**
     Sets the Ionicons icon.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.ionicon(with: icon, textColor: color, size: size ?? frame.size)
    }
    
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A NSButton that will appear as icon with Ionicons
    convenience init(withIcon icon: FontAwesome, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        self.init(image: NSImage.fontAwesome(with: icon, textColor: color, size: size), target: target, action: action)
    }
    
    /**
     Sets the FontAwesome icon.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    func setImage(withIcon icon: FontAwesome, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.fontAwesome(with: icon, textColor: color, size: size ?? frame.size)
    }
}
#endif
