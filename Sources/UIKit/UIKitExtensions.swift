#if canImport(UIKit)
import UIKit

#if !os(watchOS)
/// A Ionicons extension to UIImageView.
extension UIImageView {
    
    /// Initializes a new item using the specified `Ionicons` icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter color: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    @available(*, deprecated, message: "use: fontIcon<T: FontFamily>(_ value: T, textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage?")
    public convenience init(withName name: Ionicons, color: UIColor? = nil, size: CGSize? = nil, backgroundColor: UIColor = .clear) {
        self.init()
        image = UIImage.ionicon(with: name, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: backgroundColor)
    }
    
    /// Initializes a new item using the specified `FontAwesome` icon and other properties.
    ///
    /// - parameter name: The preferred FontAwesome icon name.
    /// - parameter color: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    @available(*, deprecated, message: "use: fontIcon<T: FontFamily>(_ value: T, textColor: UIColor, size: CGSize, backgroundColor: UIColor = .clear) -> UIImage?")
    public convenience init(withName name: FontAwesome, color: UIColor? = nil, size: CGSize? = nil, backgroundColor: UIColor = .clear) {
        self.init()
        image = UIImage.fontAwesome(with: name, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: backgroundColor)
    }
    
    /// Initializes a new item using the specified `FontFamily` icon and other properties.
    ///
    /// - parameter icon: The preferred FontAwesome icon name.
    /// - parameter color: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    public convenience init<T: FontFamily>(_ icon: T, color: UIColor? = nil, size: CGSize? = nil, backgroundColor: UIColor = .clear) {
        self.init()
        image = UIImage.fontIcon(icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: backgroundColor)
    }
    
    /// Set the specified `FontFamily` icon.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter color: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    public func setIcon<T: FontFamily>(_ font: T, color: UIColor? = nil, size: CGSize? = nil, backgroundColor: UIColor = .clear) {
        self.image = UIImage.fontIcon(font, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: backgroundColor)
    }
}

extension UIButton {
    
    /**
     Sets the Ionicons icon to use for the specified state.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControl.State.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    @available(*, deprecated, message: "use: setIcon<T: FontFamily>(_ icon: T, state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil)")
    public func setIconImage(withIcon icon: Ionicons, forState state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil) {
        let image = UIImage.ionicon(with: icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
        setImage(image, for: state)
    }
    
    /**
     Sets the icon to use for the specified state.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControl.State.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    @available(*, deprecated, message: "use: setIcon<T: FontFamily>(_ icon: T, state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil)")
    public func setIconImage(withIcon icon: FontAwesome, forState state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil) {
        let image = UIImage.fontAwesome(with: icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
        setImage(image, for: state)
    }
    
    /**
     Sets the icon `fontIcon` to use for the specified state.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControl.State.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    public func setIcon<T: FontFamily>(_ icon: T, state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil) {
        let image = UIImage.fontIcon(icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
        setImage(image, for: state)
    }
}

extension UITabBarItem {
    
    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter size: The size of the image, in points.
     - parameter icon: The icon to be used as image.
     */
    @available(*, deprecated, message: "use: setIcon<T: FontFamily>(_ icon: T, state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil)")
    public convenience init(withIcon icon: Ionicons, title: String? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black) {
        let image = UIImage.ionicon(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.hashValue)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter size: The size of the image, in points.
     - parameter icon: The icon to be used as image.
     */
    @available(*, deprecated, message: "use: setIcon<T: FontFamily>(_ icon: T, state: UIControl.State = [], color: UIColor? = nil, size: CGSize? = nil)")
    public convenience init(withIcon icon: FontAwesome, title: String? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black) {
        let image = UIImage.fontAwesome(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.hashValue)
    }
    
    /**
     Initializes a new item using the specified `FontFamily` icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter size: The size of the image, in points.
     - parameter icon: The icon to be used as image.
     */
    public convenience init<T: FontFamily>(_ icon: T, title: String? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black) {
        let image = UIImage.fontIcon(icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.name.hashValue)
    }
}

extension UIBarButtonItem {
    
    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    @available(*, deprecated, message: "use: init<T: FontFamily>(_ icon: T, target: AnyObject? = nil, action: Selector? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black, backgroundColor: UIColor = .clear)")
    public convenience init(withIcon icon: Ionicons, target: AnyObject? = nil, action: Selector? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black, backgroundColor: UIColor = .clear) {
        let image = UIImage.ionicon(with: icon, textColor: color, size: size, backgroundColor: backgroundColor)
        self.init(image: image, style: .plain, target: target, action: action)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    @available(*, deprecated, message: "use: init<T: FontFamily>(_ icon: T, target: AnyObject? = nil, action: Selector? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black, backgroundColor: UIColor = .clear)")
    public convenience init(withIcon icon: FontAwesome, target: AnyObject? = nil, action: Selector? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black, backgroundColor: UIColor = .clear) {
        let image = UIImage.fontAwesome(with: icon, textColor: color, size: size, backgroundColor: backgroundColor)
        self.init(image: image, style: .plain, target: target, action: action)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    public convenience init<T: FontFamily>(_ icon: T, target: AnyObject? = nil, action: Selector? = nil, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor = .black, backgroundColor: UIColor = .clear) {
        let image = UIImage.fontIcon(icon, textColor: color, size: size, backgroundColor: backgroundColor)
        self.init(image: image, style: .plain, target: target, action: action)
    }
    
    /**
     Set a new icon image using the specified `Ionicons` icon.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the icon, in points.
     - parameter color: The color of the icon, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    @available(*, deprecated, message: "setIcon<T: FontFamily>(_ icon: T, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor? = nil, backgroundColor: UIColor = .clear)")
    public func setIcon(withIcon icon: Ionicons, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor? = nil, backgroundColor: UIColor = .clear) {
        self.image = UIImage.ionicon(with: icon, textColor: color ?? self.tintColor ?? .black, size: size, backgroundColor: backgroundColor)
    }
    
    /**
     Set a new icon image using the specified `FontAwesome` icon.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the icon, in points.
     - parameter color: The color of the icon, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    @available(*, deprecated, message: "use: setIcon<T: FontFamily>(_ icon: T, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor? = nil, backgroundColor: UIColor = .clear)")
    public func setIcon(withIcon icon: FontAwesome, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor? = nil, backgroundColor: UIColor = .clear) {
        self.image = UIImage.fontAwesome(with: icon, textColor: color ?? self.tintColor ?? .black, size: size, backgroundColor: backgroundColor)
    }
    
    /**
     Set a new icon image using the specified `FontFamily` icon.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the icon, in points.
     - parameter color: The color of the icon, in points.
     - parameter backgroundColor: The color for the background icon.
     */
    public func setIcon<T: FontFamily>(_ icon: T, size: CGSize = CGSize(width: 24.0, height: 24.0), color: UIColor? = nil, backgroundColor: UIColor = .clear) {
        self.image = UIImage.fontIcon(icon, textColor: color ?? self.tintColor ?? .black, size: size, backgroundColor: backgroundColor)
    }
}
#endif

#endif
