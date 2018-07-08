//
//  Blog_iOSTests.swift
//  Blog iOSTests
//
//  Created by Amine Bensalah on 17/04/2018.
//

@testable import Font
import XCTest

class Font_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let font = Font(font: FontFamily.Ionicons.medium, size: 14.0)
        XCTAssertNotNil(font)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
