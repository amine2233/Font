//
//  File.swift
//  
//
//  Created by amine on 15/03/2023.
//

import Foundation

extension Bundle {
    public static var font: Bundle { Bundle(for: BundleToken.self) }
}

private final class BundleToken {}
