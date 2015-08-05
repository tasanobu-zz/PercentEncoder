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
}