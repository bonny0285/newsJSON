//
//  NewsTableViewCell.swift
//  newsAlamofire
//
//  Created by Massimiliano Bonafede on 11/09/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewContainer.bounds = self.contentView.bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
       func downloadFromURL(url : URL, contentMode mode : UIView.ContentMode = .scaleAspectFit){
           contentMode = mode
           URLSession.shared.dataTask(with: url) { [weak self]
               (data, response, error) in
               
               guard let self = self else { return }
               
               guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                   let mineType = response?.mimeType, mineType.hasPrefix("image"),
                   let data = data, error == nil,
                   let image = UIImage(data: data)
                   else { return }
               
               //self.delegate?.fetchingImageSuccessfully(image)
               DispatchQueue.main.async() { () -> Void in self.newsImage.image = image}
           }.resume()
       }
       
    func downloadedFrom(link : String, contentMode mode : UIView.ContentMode = .scaleAspectFit){
        
        guard let url = URL(string: link) else { return }
        downloadFromURL(url: url, contentMode: mode)
    }
    
}
