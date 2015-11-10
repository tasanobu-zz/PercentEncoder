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
        // escape back slash, single quote and line terminators because it is not included in ECMAScript SingleStringCharacter
        // * Must use an array to ensure the order to escape the characters.
        let mapping = [
            ("\\", "\\\\"),
            ("'", "\\'"),
            ("\n", "\\n"),
            ("\r", "\\r"),
            ("\u{2028}", "\\u2028"),
            ("\u{2029}", "\\u2029")
        ]
        
        var escaped = string
        
        for (src, dst) in mapping {
            escaped = escaped.stringByReplacingOccurrencesOfString(src, withString: dst, options: .LiteralSearch)
        }
        
        let script = "var value = \(functionName)('\(escaped)');"
        let context = JSContext()
        context.evaluateScript(script)
        let value: JSValue = context.objectForKeyedSubscript("value")
        return value.toString()
    }
}