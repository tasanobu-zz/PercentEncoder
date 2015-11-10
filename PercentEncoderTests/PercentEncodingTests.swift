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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: EncodeURI
    func testEncodeURI() {
        let encoded = PercentEncoding.EncodeURI.evaluate(string: Constants.input)
        XCTAssertEqual(
            encoded,
            "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20",
            "")
    }
    
    func testEncodeURIComponent() {
        let encoded = PercentEncoding.EncodeURIComponent.evaluate(string: Constants.input)
        XCTAssertEqual(
            encoded,
            "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20",
            "")
    }
    
    func testDecodeURI() {
        let decoded = PercentEncoding.DecodeURI.evaluate(string: Constants.inputEscapedByEncodeURI)
        XCTAssertEqual(decoded, Constants.input, "")
    }
    
    func testDecodeURIComponent() {
        let decoded = PercentEncoding.DecodeURIComponent.evaluate(string: Constants.inputEscapedByEncodeURIComponent)
        XCTAssertEqual(decoded, Constants.input, "")
    }
    
    func testInvalidJSString() {
        let plain = Constants.invalidJSString
        let encoded = Constants.encodedInvalidJSString
        XCTAssertEqual(PercentEncoding.EncodeURI.evaluate(string: plain), encoded)
        XCTAssertEqual(PercentEncoding.EncodeURIComponent.evaluate(string: plain), encoded)
        XCTAssertEqual(PercentEncoding.DecodeURI.evaluate(string: encoded), plain)
        XCTAssertEqual(PercentEncoding.DecodeURIComponent.evaluate(string: encoded), plain)
    }
    
    func testComposedCharacters() {
        let plain = Constants.composedCharacters
        let encoded = Constants.encodedComposedCharacters
        XCTAssertEqual(PercentEncoding.EncodeURI.evaluate(string: plain), encoded)
        XCTAssertEqual(PercentEncoding.EncodeURIComponent.evaluate(string: plain), encoded)
        XCTAssertEqual(PercentEncoding.DecodeURI.evaluate(string: encoded), plain)
        XCTAssertEqual(PercentEncoding.DecodeURIComponent.evaluate(string: encoded), plain)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
