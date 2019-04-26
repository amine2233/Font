#if canImport(Cocoa)
import Cocoa

extension NSImageView {
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter size: The image size.
    /// - parameter color: The image color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    @available(*, deprecated, message: "use: init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor)")
    public convenience init?(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray) {
        guard let image = NSImage.ionicon(with: icon, textColor: color, size: size) else { return nil }
        self.init(image: image)
    }

    /**
     Sets the Ionicons icon to use for the specified image view.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    @available(*, deprecated, message: "use: setImage<T: FontFamily>(_ icon: T, size: CGSize?, color: NSColor)")
    public func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.ionicon(with: icon, textColor: color, size: size ?? frame.size)
    }
    
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter size: The image size.
    /// - parameter color: The image color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    @available(*, deprecated, message: "use: init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor)")
    public convenience init?(withIcon icon: FontAwesome, size: CGSize, color: NSColor = NSColor.darkGray) {
        guard let image = NSImage.fontAwesome(with: icon, textColor: color, size: size) else { return nil }
        self.init(image: image)
    }
    
    /**
     Sets the FontAwesome icon to use for the specified image view.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    @available(*, deprecated, message: "use: setImage<T: FontFamily>(_ icon: T, size: CGSize?, color: NSColor)")
    public func setImage(withIcon icon: FontAwesome, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.fontAwesome(with: icon, textColor: color, size: size ?? frame.size)
    }
    
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
    
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter icon: The preferred Ionicons icon name.
    /// - parameter size: The image size.
    /// - parameter color: The background color (optional).
    /// - parameter target: The target (optional).
    /// - parameter action: The action (optional).
    /// - returns: A NSButton that will appear as icon with Ionicons
    @available(*, deprecated, message: "use: init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor)")
    public convenience init?(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        guard let image = NSImage.ionicon(with: icon, textColor: color, size: size) else { return nil }
        self.init(image: image, target: target, action: action)
    }

    /**
     Sets the Ionicons icon.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    @available(*, deprecated, message: "use: setImage<T: FontFamily>(_ icon: T, size: CGSize?, color: NSColor)")
    public func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.ionicon(with: icon, textColor: color, size: size ?? frame.size)
    }
    
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter icon: The preferred Ionicons icon name.
    /// - parameter size: The image size.
    /// - parameter color: The background color (optional).
    /// - parameter target: The target (optional).
    /// - parameter action: The action (optional).
    /// - returns: A NSButton that will appear as icon with FontAwesome
    @available(*, deprecated, message: "use: init?<T: FontFamily>(_ icon: T, size: CGSize, color: NSColor)")
    public convenience init?(withIcon icon: FontAwesome, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        guard let image = NSImage.fontAwesome(with: icon, textColor: color, size: size) else { return nil }
        self.init(image: image, target: target, action: action)
    }
    
    /**
     Sets the FontAwesome icon.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image.
     */
    @available(*, deprecated, message: "use: setImage<T: FontFamily>(_ icon: T, size: CGSize?, color: NSColor)")
    public func setImage(withIcon icon: FontAwesome, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        image = NSImage.fontAwesome(with: icon, textColor: color, size: size ?? frame.size)
    }
    
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
#endif
