//
//  PercentEncoding.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/4/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import Foundation
import JavaScriptCore

public enum PercentEncoding {
    case EncodeURI, EncodeURIComponent, DecodeURI, DecodeURIComponent
    
    /// return equivalent javascript function name
    private var functionName: String {
        switch self {
        case .EncodeURI:            return "encodeURI"
        case .EncodeURIComponent:   return "encodeURIComponent"
        case .DecodeURI:            return "decodeURI"
        case .DecodeURIComponent:   return "decodeURIComponent"
        }
    }
    
    public func evaluate(string string: String) -> String {
        // escape single quote becasue it is used in script string
        let escaped = string.stringByReplacingOccurrencesOfString("'", withString: "\\'")
        let script = "var value = \(functionName)('\(escaped)');"
        let context = JSContext()
        context.evaluateScript(script)
        let value: JSValue = context.objectForKeyedSubscript("value")
        return value.toString()
    }
}