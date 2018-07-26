#if canImport(UIKit)
import UIKit

#if !os(watchOS)
/// A Ionicons extension to UIImageView.
public extension UIImageView {
    /// Initializes a new item using the specified Ionicons icon and other properties.
    ///
    /// - parameter name: The preferred Ionicons icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    public convenience init(withName name: Ionicons, color: UIColor? = nil, size: CGSize? = nil, backgroundColor _: UIColor = .clear) {
        self.init()
        image = UIImage.ionicon(with: name, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
    }
    
    /// Initializes a new item using the specified icon and other properties.
    ///
    /// - parameter name: The preferred FontAwesome icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A UIImageView that will appear as icon with Ionicons
    public convenience init(withName name: FontAwesome, color: UIColor? = nil, size: CGSize? = nil, backgroundColor _: UIColor = .clear) {
        self.init()
        image = UIImage.fontAwesome(with: name, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
    }
}

public extension UIButton {
    /**
     Sets the Ionicons icon to use for the specified state.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    public func setIconImage(withIcon icon: Ionicons, forState state: UIControlState, color: UIColor? = nil, size: CGSize? = nil) {
        let image = UIImage.ionicon(with: icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
        setImage(image, for: state)
    }
    
    /**
     Sets the icon to use for the specified state.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter state: The state that uses the specified title. The values are described in UIControlState.
     - parameter color: The color of the image.
     - parameter size: The size of the image, in points.
     */
    public func setIconImage(withIcon icon: FontAwesome, forState state: UIControlState, color: UIColor? = nil, size: CGSize? = nil) {
        let image = UIImage.fontAwesome(with: icon, textColor: color ?? tintColor, size: size ?? frame.size, backgroundColor: .clear)
        setImage(image, for: state)
    }
}

public extension UITabBarItem {
    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter size: The size of the image, in points.
     - parameter icon: The icon to be used as image.
     */
    public convenience init(withIcon icon: Ionicons, title: String?, size: CGSize, color: UIColor) {
        let image = UIImage.ionicon(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.hashValue)
    }

    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter icon: The icon to be used as image.
     */
    public convenience init(withIcon icon: Ionicons, title: String?, color: UIColor = .black) {
        let image = UIImage.ionicon(with: icon, textColor: color, size: CGSize(width: 30.0, height: 30.0), backgroundColor: .clear)
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
    public convenience init(withIcon icon: FontAwesome, title: String?, size: CGSize, color: UIColor) {
        let image = UIImage.fontAwesome(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.hashValue)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     The tag is automatically assigned using the icon's raw integer value.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter title: The item's title. If nil, a title is not displayed.
     - parameter icon: The icon to be used as image.
     */
    public convenience init(withIcon icon: FontAwesome, title: String?, color: UIColor = .black) {
        let image = UIImage.fontAwesome(with: icon, textColor: color, size: CGSize(width: 30.0, height: 30.0), backgroundColor: .clear)
        self.init(title: title, image: image, tag: icon.hashValue)
    }
}

public extension UIBarButtonItem {
    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image, in points.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    public convenience init(withIcon icon: Ionicons, target: AnyObject?, action: Selector, size: CGSize, color: UIColor) {
        let image = UIImage.ionicon(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(image: image, style: .plain, target: target, action: action)
    }

    /**
     Initializes a new item using the specified Ionicons icon and other properties.
     - parameter icon: The Ionicons icon to be used as image.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    public convenience init(withIcon icon: Ionicons, target: AnyObject?, action: Selector) {
        self.init(withIcon: icon, target: target, action: action, size: CGSize(width: 24.0, height: 24.0), color: .blue)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter size: The size of the image, in points.
     - parameter color: The color of the image, in points.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    public convenience init(withIcon icon: FontAwesome, target: AnyObject?, action: Selector, size: CGSize, color: UIColor) {
        let image = UIImage.fontAwesome(with: icon, textColor: color, size: size, backgroundColor: .clear)
        self.init(image: image, style: .plain, target: target, action: action)
    }
    
    /**
     Initializes a new item using the specified icon and other properties.
     - parameter icon: The FontAwesome icon to be used as image.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.
     */
    public convenience init(withIcon icon: FontAwesome, target: AnyObject?, action: Selector) {
        self.init(withIcon: icon, target: target, action: action, size: CGSize(width: 24.0, height: 24.0), color: .blue)
    }
}
#endif

#endif
