//
//  String+PercentEncoder.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/4/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import Foundation

public extension String {
    func ped_encodeURI() -> String {
        return PercentEncoding.encodeURI.evaluate(string: self)
    }
    
    func ped_encodeURIComponent() -> String {
        return PercentEncoding.encodeURIComponent.evaluate(string: self)
    }
    
    func ped_decodeURI() -> String {
        return PercentEncoding.decodeURI.evaluate(string: self)
    }
    
    func ped_decodeURIComponent() -> String {
        return PercentEncoding.decodeURIComponent.evaluate(string: self)
    }
}
