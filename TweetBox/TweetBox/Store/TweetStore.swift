//
//  TweetStore.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import Twitter

typealias TweetCompletion = (TweetResult) -> Void

 //MARK:- Tweet Result

/**
 
 Tweet result from API
 
 - success: Array of tweets
 - failure: Error (Data task Error, processing error )
 
 */

enum TweetResult{
    case success([Tweet])
    case failure(Error)
}

class TweetStore{
    
    var comp: TweetCompletion = {_ in}
    var tweets = [Tweet]()
    
    /**
     Fetches tweets from Twitter framework
     
     - Parameters:
     - completion: TweetCompletion.
     
     - Returns:
     Void
     */
    
    
    func fetchTweets(searchTerm: String, completion: @escaping TweetCompletion){
        self.comp = completion
        
        
        let request = Twitter.Request(search: searchTerm,count: 100)
        
        request.fetchTweets { (result) in
            OperationQueue.main.addOperation {
                completion(.success(result))
//                self.comp = (.success(result))
//                let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: (#selector(self.updatetimer)), userInfo: nil, repeats: false)
//
//                self.tweets = result
            }
        }
    }
    
//    @objc func updatetimer(){
//        comp((.success(self.tweets)))
//    }
    
    /**
     Performs sentiment analysis - from WATSON API
     
     - Parameters:
     - completion: SentimentAnalysisCompletion.
     
     - Returns:
     Void
     */
    
    
    func performSentimentAnalysis(for tweets:[Tweet],completion: @escaping SentimentAnalysisCompletion){
        if tweets.count > 0{
            let tweets = tweets.flatMap { $0.text }.joined(separator: "")
            
            WatsonAPI.textSentimentAnalysis(for: tweets, completion: { (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
        }
    }
}
