
PercentEncoder
===
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![CocoaPods](https://img.shields.io/cocoapods/v/PercentEncoder.svg)]()
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Issues](https://img.shields.io/github/issues/tasanobu/PercentEncoder.svg?style=flat
)](https://github.com/tasanobu/PercentEncoder/issues?state=open)
[![Platform](https://img.shields.io/cocoapods/p/PercentEncoder.svg?style=flat)](http://cocoadocs.org/docsets/PercentEncoder)

```PercentEncoder``` is a lightweight library to escape string using so called [URL encoding](https://en.wikipedia.org/wiki/Percent-encoding) in Swift.

## Introduction
```PercentEncoder``` uses ```JavaScriptCore``` framework for URL-encoding although URL-encoding is executed with ```CFURLCreateStringByAddingPercentEscapes()``` or ```NSString.stringByAddingPercentEncodingWithAllowedCharacters()``` in most cases.  
The followings is the reason and has motivated me to make this library.

- ```CFURLCreateStringByAddingPercentEscapes()``` deprecated in iOS9
- ```NSString.stringByAddingPercentEncodingWithAllowedCharacters()``` is introduced from iOS 7. However it won't work in multi-byte languages like Japanes, Chinese, etc and an app crashes as shown at [the issue in Alamorefire](https://github.com/Alamofire/Alamofire/issues/206).

## Usage
```PercentEncoder``` offers ```PercentEncoding``` enum and ```String``` extension methos for URL-encoding.

#### PercentEncoding
```PercentEncoding``` has four values which are equivalent to Javscript functions(```encodeURI```, ```encodeURIComponent```, ```decodeURI```, ```decodeURIComponent```).
```swift
let url = "http://tasanobu.jp?city=東京&year='20"

/// EncodeURI
let escaped = PercentEncoding.EncodeURI.evaluate(string: url)
// encoded to "http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20"

/// DecodeURI
PercentEncoding.DecodeURIComponent.evaluate(string: escaped)
// decoded back to "http://tasanobu.jp?city=東京&year='20"


let value = "東京" // 東京 means Tokyo which is the capital of Japan.

/// EncodeURI
let encoded = PercentEncoding.EncodeURIComponent.evaluate(string: value)
// encoded to "%E6%9D%B1%E4%BA%AC"

/// DecodeURI
PercentEncoding.DecodeURIComponent.evaluate(string: encoded)
// decoded back to "東京"
```

#### String extension
```PercentEncoding``` offers String extension methods which are equivalent to Javscript functions(```encodeURI```, ```encodeURIComponent```, ```decodeURI```, ```decodeURIComponent```).

```swift
/// encodeURI
"http://tasanobu.jp?city=東京&year='20".ped_encodeURI()

/// decodeURI
"http://tasanobu.jp?city=%E6%9D%B1%E4%BA%AC&year='20".ped_decodeURI()


/// encodeURIComponent
let encoded = "東京".ped_encodeURIComponent()
// encoded to "%E6%9D%B1%E4%BA%AC"

/// decodeURIComponent
encoded.ped_decodedURIComponent()
// decoded back to "東京"
```

## Requirements
- Swift 4.0
- Xcode 9.0
- iOS 8.0+


## Installation
- Install with Cocoapods

  ```ruby
  platform :ios, '8.0'
  use_frameworks!

  pod 'PercentEncoder'
  ```

- Git submodule


## Release Notes
See https://github.com/tasanobu/PercentEncoder/releases

## License
```PercentEncoder``` is released under the MIT license. See LICENSE for details.
