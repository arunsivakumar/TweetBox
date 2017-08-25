//
//  TweetViewController.swift
//  TweetBox
//
//  Created by Lakshmi on 8/6/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    var tweetStore:TweetStore!
    var searchTerm:String!{
        didSet{
            searchTerm = "#" + searchTerm
        }
    }
    
    
    var tweetsCompletion: TweetCompletion = {_ in }
    var sentimentAnalysisCompletion: SentimentAnalysisCompletion = {_ in }
    
    weak var headerView:TweetAnalysisTableViewCell!
    
    var tweetDataSource = TweetDataSource()
    deinit {
        print("left memory")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpTableView()
        setUpCompletion()
        loadData()

    }
    
    func setUpUI(){
        self.navigationItem.title = searchTerm
    }
    
    func setUpTableView(){
//        tableView.delegate = self
        tableView.dataSource = tweetDataSource
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerView = tableView.dequeueReusableCell(withIdentifier: "TweetAnalysisTableViewCell") as! TweetAnalysisTableViewCell
        tableView.tableHeaderView = headerView
        
    }
    
    func setUpCompletion(){
        
        tweetsCompletion = { [weak self] result in
            
            guard let _ = self else{return}
            
            switch result{
            case let .success(tweets):
                self?.tweetDataSource.tweets = tweets
                self?.tweetStore.performSentimentAnalysis(for: tweets, completion: (self?.sentimentAnalysisCompletion)!)
            case .failure(_):
                self?.tweetDataSource.tweets.removeAll()
            }
            self?.tableView.reloadData()
        }
        
        sentimentAnalysisCompletion = { [weak self] result in
            
            guard let _ = self else{return}
            
            switch result {
            case let .success(score):
                self?.headerView.score = score
            case .failure(_):
                break
            }
        }
    }
    
    func loadData(){
        tweetStore.fetchTweets(searchTerm: searchTerm, completion: tweetsCompletion)
    }

    
}

//
//extension TweetViewController:UITableViewDelegate{
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetAnalysisTableViewCell") as! TweetAnalysisTableViewCell
//        cell.searchTerm = searchTerm
//        return cell
//    }
//    
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return tableView.rowHeight
//    }
//    
//}
