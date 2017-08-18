//
//  SearchViewController.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var tweetStore:TweetStore!
    

    @IBOutlet weak var searchTextField: UITextField!{
        didSet{
            searchTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
//        tweetStore.fetchTweets { (result) in
//            
//        }
    }
    
    func configureUI(){
        searchTextField.becomeFirstResponder()
    }
}


extension SearchViewController:UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            performSegue(withIdentifier: "showTweets", sender: self)
        }
        return true
    }
}
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

