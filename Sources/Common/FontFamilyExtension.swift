//
//  FontFamilyExtension.swift
//  Font macOS
//
//  Created by Amine Bensalah on 13/12/2019.
//

import Foundation

public extension FontFamily {
    /// Get a FontFamily string from the given CSS icon code.
    ///
    /// - parameter code: The preferred icon name.
    /// - returns: FontFamily icon.
    static func fromCode(_ code: String) -> Self? {
        return Self(rawValue: code)
    }
}
