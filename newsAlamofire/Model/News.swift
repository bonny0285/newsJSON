//
//  News.swift
//  newsAlamofire
//
//  Created by Massimiliano on 11/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit


class News {
    //MARK: - Properies

    var author: String
    var title: String
    var url: String
    var urlToImage: String
    
    //MARK: - Lifecycle

    init(author: String, title: String, url: String, urlImage: String) {
        self.author = author
        self.title = title
        self.url = url
        self.urlToImage = urlImage
    }
}
