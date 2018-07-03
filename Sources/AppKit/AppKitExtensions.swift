import Cocoa

extension NSImageView {
    convenience init(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray) {
        self.init(image: NSImage.ionicon(with: icon, textColor: color, size: size))
    }
    
    func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        self.image = NSImage.ionicon(with: icon, textColor: color, size: size ?? self.frame.size)
    }
}

extension NSButton {
    convenience init(withIcon icon: Ionicons, size: CGSize, color: NSColor = NSColor.darkGray, target: Any? = nil, action: Selector? = nil) {
        self.init(image: NSImage.ionicon(with: icon, textColor: color, size: size), target: target, action: action)
    }
    
    func setImage(withIcon icon: Ionicons, size: CGSize? = nil, color: NSColor = NSColor.darkGray) {
        self.image = NSImage.ionicon(with: icon, textColor: color, size: size ?? self.frame.size)
    }
}
