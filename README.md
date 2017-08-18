# TweetBox

## Installation

This project uses [Carthage][1] to manage 3rd party libraries

```
$ cd TweetBox
```

```
$ carthage update --platform iOS
```
```
$ open TweetBox.xcworkspace
```

## Note

Login into your iOS device Twitter account before you run the app

## Requirements
* iOS 10.3+
* Xcode 8+
* Swift 3.0+

## Description

iOS app to search and understand pulse (positive/neutral/negative) of trending tweets on twitter.

## Design
- [x] Twitter Framework - Fetch tweets from twitter
- [x] Extract text from tweets
- [x] IBM Watson Swift SDK[watson-developer-cloud][2] - Perform text sentiment-analysis
- [x] Alamofire/SwiftyJSON - Network requests/JSON Parsing
- [x] Kingfisher - Image caching

## Screenshots

![Screen1](https://github.com/arunsivakumar/TweetBox/blob/master/screens/screen1.png) 

![Screen2](https://github.com/arunsivakumar/TweetBox/blob/master/screens/screen2.png) 

[1]: https://github.com/Carthage/Carthage
[2]: https://github.com/watson-developer-cloud/swift-sdk
