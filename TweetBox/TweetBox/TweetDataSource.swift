//
//  TweetDataSource.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit
import Twitter


class TweetDataSource:NSObject,UITableViewDataSource{
    
  
    var tweets = [Tweet]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    
}
