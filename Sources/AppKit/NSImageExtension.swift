import Cocoa

public extension NSImage {
    public static func ionicon(with name: Ionicons, textColor: NSColor, size: CGSize, backgroundColor: NSColor = NSColor.clear, edgeInsets: NSEdgeInsets = NSEdgeInsetsZero) -> NSImage {
        let fontSize = min(size.width, size.height)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontsAttributes = [NSAttributedStringKey.font: FontFamily.Ionicons.medium.font(size: fontSize), NSAttributedStringKey.foregroundColor: textColor, NSAttributedStringKey.backgroundColor: backgroundColor, NSAttributedStringKey.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: String.ionicon(with: name), attributes: fontsAttributes)
        
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
        
        if let repo = rep {
            let context = NSGraphicsContext(bitmapImageRep: repo)
            
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = context
            
            attributedString.draw(in: rect)
            
            NSGraphicsContext.restoreGraphicsState()
            
            let image = NSImage(size: size)
            image.addRepresentation(rep!)
            
            return image
        } else {
            return NSImage()
        }
    }
    
    public static func fontAwesome(with name: FontAwesome, textColor: NSColor, size: CGSize, backgroundColor: NSColor = NSColor.clear, edgeInsets: NSEdgeInsets = NSEdgeInsetsZero) -> NSImage {
        let fontSize = min(size.width, size.height)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        let fontsAttributes = [NSAttributedStringKey.font: FontFamily.FontAwesome.medium.font(size: fontSize), NSAttributedStringKey.foregroundColor: textColor, NSAttributedStringKey.backgroundColor: backgroundColor, NSAttributedStringKey.paragraphStyle: paragraph]
        let attributedString = NSAttributedString(string: String.fontAwesome(with: name), attributes: fontsAttributes)
        
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
        
        if let repo = rep {
            let context = NSGraphicsContext(bitmapImageRep: repo)
            
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = context
            
            attributedString.draw(in: rect)
            
            NSGraphicsContext.restoreGraphicsState()
            
            let image = NSImage(size: size)
            image.addRepresentation(rep!)
            
            return image
        } else {
            return NSImage()
        }
    }
}
