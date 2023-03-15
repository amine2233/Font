#if canImport(SwiftUI)
import SwiftUI

#if os(OSX)
    import AppKit.NSColor
    public typealias FColor = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIColor
    public typealias FColor = UIColor
#endif

extension Image {
    init<T: FontFamily>(
        _ value: T,
        foregroundColor: FColor,
        size: CGSize,
        backgroundColor: FColor = .clear,
        borderWidth: CGFloat = 0,
        borderColor: FColor = .clear
    ) {
        #if os(macOS)
        let nsimage = NSImage.font(
            value,
            textColor: foregroundColor,
            size: size,
            backgroundColor: backgroundColor
        )
        self.init(nsImage: nsimage ?? NSImage())
        #else
        let uiimage = UIImage.fontIcon(
            value,
            textColor: foregroundColor,
            size: size,
            backgroundColor: backgroundColor,
            borderWidth: borderWidth,
            borderColor: borderColor
        )
        self.init(uiImage: uiimage ?? UIImage())
        #endif
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Image(
            Ionicons.alert,
            foregroundColor: .black,
            size: .init(width: 24.0, height: 24.0)
        )
    }
}


#endif
