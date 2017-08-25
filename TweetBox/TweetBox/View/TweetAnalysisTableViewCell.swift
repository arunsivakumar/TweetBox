//
//  TweetAnalysisTableViewCell.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class TweetAnalysisTableViewCell: UITableViewCell {
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var analysisLabel: UILabel!
    @IBOutlet weak var analyzingLabel: UILabel!
    

    
    //MARK:- Variables
    var score:Double?{
        didSet{
            if let score = score{
                analyzingLabel.isHidden = true
                print(score)
                switch score{
                case 0.01 ... 1.0:
                    analysisLabel.textColor = UIColor.green
                case -1.0 ... -0.01:
                    analysisLabel.textColor = UIColor.red
                default:
                    analysisLabel.textColor = UIColor.blue
                }
                let percentage = String(format: "%.2f", score * 100)
                analysisLabel.text = "\(percentage)%"
            }
        }
    }
    
    //MARK:- Lifecycle

    override func prepareForReuse() {
        analyzingLabel.isHidden = false
        analysisLabel.textColor = UIColor.darkGray

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        analyzingLabel.isHidden = false
        analysisLabel.textColor = UIColor.darkGray

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
