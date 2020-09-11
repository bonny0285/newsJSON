//
//  NewsDataSource.swift
//  newsAlamofire
//
//  Created by Massimiliano Bonafede on 10/09/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit


class NewsDataSource: NSObject {
    
    let news: [News]
    var organizer: DataOrganizer
    
    init(news: [News]) {
        self.news = news
        self.organizer = DataOrganizer(news: news)
    }
    
    func getAuthor(at indexPath: IndexPath) -> String {
        news[indexPath.row].author
    }
    
    func getURL(at indexPath: IndexPath) -> String {
        news[indexPath.row].url
    }
}


extension NewsDataSource {
    struct DataOrganizer {
        
        let news: [News]
        
        var newsCount: Int {
            news.count
        }
        
        init(news: [News]) {
            self.news = news
        }
        
        func signleNews(at indexPath: IndexPath) -> News {
            self.news[indexPath.row]
        }
    }
}

extension NewsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        organizer.newsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell()}
        
        let news = organizer.signleNews(at: indexPath)
        cell.configureWith(news)
        
        return cell
    }
}


extension NewsTableViewCell {
    func configureWith(_ news: News) {
        self.titleLable.text = news.title
        self.authorLabel.text = news.author
        self.urlLabel.text = news.url
        self.downloadedFrom(link: news.urlToImage)
    }
}
