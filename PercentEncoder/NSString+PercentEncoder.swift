//
//  NSString+PercentEncoder.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/5/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import Foundation

public extension NSString {
    func ped_encodeURI() -> NSString {
        let encoded = (self as String).ped_encodeURI()
        return encoded as NSString
    }
    
    func ped_encodeURIComponent() -> NSString {
        let encoded = (self as String).ped_encodeURIComponent()
        return encoded as NSString
    }
    
    func ped_decodeURI() -> NSString {
        let decoded = (self as String).ped_decodeURI()
        return decoded as NSString
    }
    
    func ped_decodeURIComponent() -> NSString {
        let decoded = (self as String).ped_decodeURIComponent()
        return decoded as NSString
    }
}