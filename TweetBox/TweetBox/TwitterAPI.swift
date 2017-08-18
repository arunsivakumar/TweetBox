//
//  TwitterAPI.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation

enum TwitterError: Error{
    case invalidJSON
}

enum TwitterMethod:String{
    case search = "search/tweets"
}


struct TwitterAPI{
    
    
    private static let baseURLString =  "https://api.twitter.com/1.1/search/tweets.json?q=%40twitterapi"
    private static let apiKey = "fd3c0d32acfaca425895462a4194ee13"
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ss HH:mm:ss"
        return formatter
    }()
    
    private static func constructURL(method:TwitterMethod, parameters:[String:String]?) -> URL{
        
        var components = URLComponents(string:baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
//        let baseParameters = [
//            "method": method.rawValue,
//            "format": "json",
//            "nojsoncallback": "1",
//            "api_key": apiKey
//        ]
//        
//        for (key, value) in baseParameters {
//            let item = URLQueryItem(name: key, value: value)
//            queryItems.append(item)
//        }
        
        if let parameters = parameters{
            for(key,value) in parameters{
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static var searchTweetsURL: URL{
        return constructURL(method: .search, parameters: nil)
    }

    
    
//    static func tweets(from json: JSON) -> TweetResult{
//        
//        var tweetItems = [Tweet]()
//        
//        guard
//            let tweets = json["tweets"].dictionary,
//            let tweetArray = tweets["tweet"]?.array else{
//                
//                return .failure(TwitterError.invalidJSON)
//        }
//        
//        for tweetJSON in tweetArray{
//            if let tweet = tweet(from: tweetJSON){
//                tweetItems.append(tweet)
//            }else{
//                // invalid json
//            }
//        }
//        
//        // check if JSON processing failed completely
//        
//        return .success(tweetItems)
//    }
//    
//    private static func tweet(from json:JSON) -> Tweet?{
////        guard
////            let id = json["id"].string,
////            let title = json["title"].string,
////            let dateString = json["datetaken"].string,
////            let urlString = json["url_h"].string,
////            let url = URL(string:urlString),
////            let dateTaken = dateFormatter.date(from: dateString) else{
////                
////                // Information is not enough to construct a photo
////                return nil
////        }
////        return Photo(id: id, title: title, url: url, dateTaken: dateTaken)
//        
//        return nil
//    }

    
    
}
