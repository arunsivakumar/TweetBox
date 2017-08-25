//
//  WatsonAPI.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import NaturalLanguageUnderstandingV1

typealias SentimentAnalysisCompletion = (SentimentAnalysisResult) -> Void

enum SentimentAnalysisResult{
    case success(Double?)
    case failure(Error)
}
struct WatsonAPI{
    
    static let username = "39ed3059-843d-4a17-9b18-f082efb30f18"
    static let password = "AocW17FwtINF"
    static let version = "2017-08-06"
    
    
    static func textSentimentAnalysis(for textToAnalyze: String, completion: @escaping SentimentAnalysisCompletion) {

        let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(username: username, password: password, version: version)
        

        let features = Features(concepts: ConceptsOptions(limit: 5),semanticRoles: SemanticRolesOptions(limit:5), sentiment: SentimentOptions(document: true))
        let parameters = Parameters(features: features, text: textToAnalyze)
        
        let failure = { (error: Error) in completion(.failure(error)) }
        naturalLanguageUnderstanding.analyzeContent(withParameters: parameters, failure: failure) {
            results in
//            print (results.sentiment?.document?.score!)
            
            let score = results.sentiment?.document?.score
            completion(.success(score))
        }
    }

}
