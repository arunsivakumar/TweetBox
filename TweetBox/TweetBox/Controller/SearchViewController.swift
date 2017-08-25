//
//  SearchViewController.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
//MARK:- Public API
    
    var tweetStore:TweetStore!
    
//MARK:- Outlets
    
    @IBOutlet weak var searchTextField: UITextField!{
        didSet{
            searchTextField.delegate = self
        }
    }
    
//MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
//        tweetStore.fetchTweets { (result) in
//            
//        }
    }
    
//MARK:- UI
    
    func configureUI(){
        searchTextField.becomeFirstResponder()
    }
}


//MARK:- Textfield Delegates

extension SearchViewController:UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            performSegue(withIdentifier: "showTweets", sender: self)
        }
        return true
    }
}

//MARK:- Navigation

extension SearchViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showTweets"?:
            
                let vc =
                    segue.destination as! TweetViewController
                vc.tweetStore = self.tweetStore
                vc.searchTerm = self.searchTextField.text
            

        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}

