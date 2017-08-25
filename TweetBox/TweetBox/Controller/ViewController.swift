//
//  ViewController.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

import NaturalLanguageUnderstandingV1

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sentimentAnalysis()
    }
    
    
    func sentimentAnalysis(){
        
        let username = "39ed3059-843d-4a17-9b18-f082efb30f18"
        let password = "AocW17FwtINF"
        let version = "2017-08-06" // use today's date for the most recent version
        
        let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(username: username, password: password, version: version)
        
        let textToAnalyze = "I like you, i really love you"

        
        let features = Features(concepts: ConceptsOptions(limit: 5),semanticRoles: SemanticRolesOptions(limit:5), sentiment: SentimentOptions(document: true))
        let parameters = Parameters(features: features, text: textToAnalyze)
        
        let failure = { (error: Error) in print(error ) }
        naturalLanguageUnderstanding.analyzeContent(withParameters: parameters, failure: failure) {
            results in 
            print (results.sentiment?.document?.score!)
        }
    }


}

