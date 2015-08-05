//
//  String+PercentEncoderTests.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/5/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import XCTest

class String_PercentEncoderTests: XCTestCase {

    let input = "http://tasanobu.jp?city=東京&year='20"
    let inputEscapedByEncodeURI = "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20"
    let inputEscapedByEncodeURIComponent = "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testEncodeURI() {
        let encoded = input.ped_encodeURI()
        XCTAssertEqual(
            encoded,
            "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20",
            "")
    }

    func testEncodeURIComponent() {
        let encoded = input.ped_encodeURIComponent()
        XCTAssertEqual(
            encoded,
            "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20",
            "")
    }
    
    func testDecodeURI() {
        let decoded = inputEscapedByEncodeURI.ped_decodeURI()
        XCTAssertEqual(decoded, input, "")
    }

    func testDecodeURIComponent() {
        let decoded = inputEscapedByEncodeURIComponent.ped_decodeURIComponent()
        XCTAssertEqual(decoded, input, "")
    }
}
