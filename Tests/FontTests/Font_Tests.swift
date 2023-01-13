//
//  Font_iOSTests.swift
//  Font iOSTests
//
//  Created by Amine Bensalah on 17/04/2018.
//

import XCTest
@testable import Font

class Font_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoadIoniconsFont() {
        let ioniconsFont = Font(font: Ionicons.fontConvertible, size: 14.0)
        XCTAssertNotNil(ioniconsFont)
        Ionicons.fontConvertible.unregister()
    }

    func testLoadFontAwesomeSolid() {
        let fontAwesomeFont = Font(font: FontAwesomeSolid.fontConvertible, size: 14.0)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeSolid.fontConvertible.unregister()
    }

    func testLoadFontAwesomeRegular() {
        let fontAwesomeFont = Font(font: FontAwesomeRegular.fontConvertible, size: 14.0)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeRegular.fontConvertible.unregister()
    }

    func testLoadFontAwesomeBrands() {
        let fontAwesomeFont = Font(font: FontAwesomeBrands.fontConvertible, size: 14.0)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeBrands.fontConvertible.unregister()
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
    func testLoadIoniconsFontForTextStyle() {
        let ioniconsFont = Font.font(forTextStyle: .body, font: Ionicons.fontConvertible)
        XCTAssertNotNil(ioniconsFont)
        Ionicons.fontConvertible.unregister()
    }

    func testLoadFontAwesomeSolidForTextStyle() {
        let fontAwesomeFont = Font.font(forTextStyle: .title1, font: FontAwesomeSolid.fontConvertible)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeSolid.fontConvertible.unregister()
    }

    func testLoadFontAwesomeRegularForTextStyle() {
        let fontAwesomeFont = Font.font(forTextStyle: .title3, font: FontAwesomeRegular.fontConvertible)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeRegular.fontConvertible.unregister()
    }

    func testLoadFontAwesomeBrandsForTextStyle() {
        let fontAwesomeFont = Font.font(forTextStyle: .footnote, font: FontAwesomeBrands.fontConvertible)
        XCTAssertNotNil(fontAwesomeFont)
        FontAwesomeBrands.fontConvertible.unregister()
    }
    #endif

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
