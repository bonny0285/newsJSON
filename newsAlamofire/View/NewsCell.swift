//
//  NewsCell.swift
//  newsAlamofire
//
//  Created by Massimiliano on 11/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit


class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var linkLbl: UILabel!
    
    
    func setupTable(title : String, image : String, link : String){
        titleNews.text = title
        imageNews.downloadedFrom(link: image)
        linkLbl.text = link
    }
    
    
}
