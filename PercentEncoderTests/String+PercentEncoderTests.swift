//
//  String+PercentEncoderTests.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/5/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import XCTest

class String_PercentEncoderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testEncodeURI() {
        let encoded = Constants.input.ped_encodeURI()
        XCTAssertEqual(
            encoded,
            "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20",
            "")
    }

    func testEncodeURIComponent() {
        let encoded = Constants.input.ped_encodeURIComponent()
        XCTAssertEqual(
            encoded,
            "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20",
            "")
    }
    
    func testDecodeURI() {
        let decoded = Constants.inputEscapedByEncodeURI.ped_decodeURI()
        XCTAssertEqual(decoded, Constants.input, "")
    }

    func testDecodeURIComponent() {
        let decoded = Constants.inputEscapedByEncodeURIComponent.ped_decodeURIComponent()
        XCTAssertEqual(decoded, Constants.input, "")
    }
}
