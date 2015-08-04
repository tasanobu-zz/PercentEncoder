//
//  PercentEncoderTests.swift
//  PercentEncoderTests
//
//  Created by Kazunobu Tasaka on 8/4/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import UIKit
import XCTest
import PercentEncoder

class PercentEncodingTests: XCTestCase {
    let input = "http://tasanobu.jp?city=東京&year='20"
    let inputEscapedByEncodeURI = "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20"
    let inputEscapedByEncodeURIComponent = "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: EncodeURI
    func testEncodeURI() {
        let encoded = PercentEncoding.EncodeURI.evaluate(string: input)
        XCTAssertEqual(
            encoded,
            "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20",
            "")
    }
    
    func testEncodeURIComponent() {
        let encoded = PercentEncoding.EncodeURIComponent.evaluate(string: input)
        XCTAssertEqual(
            encoded,
            "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20",
            "")
    }
    
    func testDecodeURI() {
        let decoded = PercentEncoding.DecodeURI.evaluate(string: inputEscapedByEncodeURI)
        XCTAssertEqual(decoded, input, "")
    }
    
    func testDecodeURIComponent() {
        let decoded = PercentEncoding.DecodeURIComponent.evaluate(string: inputEscapedByEncodeURIComponent)
        XCTAssertEqual(decoded, input, "")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
