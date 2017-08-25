//
//  TweetTableViewCell.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import Twitter
import Kingfisher

class TweetTableViewCell:UITableViewCell{
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ss HH:mm:ss"
        return formatter
    }()
    
    var tweet:Tweet?{
        didSet{
            if let tweet = tweet{
                tweetLabel?.text = tweet.text
                userLabel?.text = tweet.user.description
                
                if let url = tweet.user.profileImageURL {
                    profileImageView.kf.setImage(with: url)
                }
                
                let created = tweet.created
                
                let formatter = DateFormatter()
                if Date().timeIntervalSince(created) > 24*60*60 {
                    formatter.dateStyle = .short
                } else {
                    formatter.timeStyle = .short
                }
                createdLabel?.text = formatter.string(from: created)
            }
            
        }
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        createdLabel.text = nil
        userLabel.text = nil
        tweetLabel.text = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2.0
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 1.0
        
        
    }
}



