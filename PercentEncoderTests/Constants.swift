//
//  Constants.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/5/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import Foundation

struct Constants {
    static let input = "http://tasanobu.jp?city=東京&year='20"
    static let inputEscapedByEncodeURI = "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20"
    static let inputEscapedByEncodeURIComponent = "http%3A%2F%2Ftasanobu.jp%3Fcity%3D%E6%9D%B1%E4%BA%AC%26year%3D'20"
    
    static let invalidJSString = "\\'\nabc\r123\u{2029}DEF\u{2028}大阪\r\n"
    static let encodedInvalidJSString = "%5C'%0Aabc%0D123%E2%80%A9DEF%E2%80%A8%E5%A4%A7%E9%98%AA%0D%0A"
    
    static let composedCharacters = "(ه'́⌣'̀ه )"  // JS invalid charactor + combining character
    static let encodedComposedCharacters = "(%D9%87'%CC%81%E2%8C%A3'%CC%80%D9%87%20)"
}