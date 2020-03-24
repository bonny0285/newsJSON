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
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    
    
    func setupTable(title : String, image : String, link : String, auth: String){
        self.titleNews.text = title
        // print("URL",image)
        self.linkLbl.text = link
        self.authorLbl.text = "Author's: \(auth)"
        
        DispatchQueue.main.async {

           self.loadingBar.startAnimating()
           
            
            
            
            //self.imageNews.image = self.getImage(myUrl: image)
            //self.imageNews.downloadedFrom(link: image)
            self.performRequest(urlString: image)
            
        
        }
        
        
    }
    
    
//    func getImage(myUrl: String) -> UIImage{
//
//        var myImage: UIImage!
//        var noImage : UIImage = UIImage.init(named: "noImage")!
//
//        if myUrl.hasPrefix("https://www."){
//            print("HTTPS://")
//            print(myUrl)
//            // loadingBar.startAnimating()
//            let url = URL(string: myUrl)
//            let data = try? Data(contentsOf: url!)
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//
//        } else if !myUrl.hasPrefix("https://www."){
//            print("NO WWWW")
//            var myString = myUrl
//            myString.insert(contentsOf: ["w","w","w","."], at: myString.index(myString.startIndex, offsetBy: 8))
//            let url = URL(string: myString)
//            let data = try? Data(contentsOf: url!) ?? Data()
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//
//        }
//        else if myUrl.hasPrefix("//"){
//            print("//")
//            print("https:" + myUrl)
//            let url = URL(string: "https:" + myUrl)
//            let data = try? Data(contentsOf: url!)
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//        } else if myUrl.hasPrefix("/"){
//            print("/")
//            print("https:/" + myUrl)
//            let url = URL(string: "https:/" + myUrl)
//            let data = try? Data(contentsOf: url!)
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//        } else if myUrl.hasPrefix("httpss"){
//            var myString = myUrl
//            myString.remove(at: myString.index(myString.startIndex, offsetBy: 5))
//            let url = URL(string: myString)
//            let data = try? Data(contentsOf: url!)
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//        } else if myUrl.hasPrefix("http://"){
//            var myString = myUrl
//            myString.insert("s" as Character, at: myUrl.index(myUrl.startIndex, offsetBy: 4))
//            let url = URL(string: myString)
//            let data = try? Data(contentsOf: url!)
//            myImage = UIImage(data: data!) ?? noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//        } else {
//            print("UNKNOW")
//            print(myUrl)
////            let url = URL(string: myUrl)
////            let data = try? Data(contentsOf: url!)
////            myImage = UIImage(data: data!) ?? noImage
//            myImage = noImage
//            loadingBar.stopAnimating()
//            loadingBar.isHidden = true
//        }
//        return myImage
//    }
    
    
    
    
    
    
    func refactURL(url: String) -> String{
        
        var myString = url
        
        if myString.hasPrefix("https://www."){
            print("URL OK")
            print(url)
        } else if myString.hasPrefix("http://www"){
            print("URL NO S")
            //myString = url
            myString.insert("s" as Character, at: myString.index(myString.startIndex, offsetBy: 4))
            print(myString)
        } else if myString.hasPrefix("https://"){
            print("URL NO WWW")
            //myString = url
            myString.insert(contentsOf: ["w","w","w","."], at: myString.index(myString.startIndex, offsetBy: 8))
            print(myString)
        } else if myString.hasPrefix("htppss"){
            print("URL SS")
            //myString = url
            myString.remove(at: myString.index(myString.startIndex, offsetBy: 5))
            print(myString)
        } else if myString.hasPrefix("//"){
            print("URL //")
            //myString = url
            myString = ("https:" + url)
            print(myString)
        } else if myString.hasPrefix("/"){
            print("/")
            //myString = url
            myString = ("https:/" + url)
            print(myString)
        }
        
        return myString
    }
    
    

    
    
    func performRequest(urlString : String){
        let noImage : UIImage = UIImage.init(named: "noImage")!
        
        //1. Create a URL
//        if let url = URL(string: refactURL(url: urlString)) {
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                   // self.delegate?.didFailWithError(error: error!)
                    print(error!.localizedDescription)
                    DispatchQueue.main.async {
                        self.imageNews.image = noImage
                        self.loadingBar.stopAnimating()
                        self.loadingBar.isHidden = true
                    }
                    return
                }
                if let safeData = data {
                    
                    DispatchQueue.main.async {
                        self.imageNews.image = UIImage.init(data: safeData)
                        self.loadingBar.stopAnimating()
                        self.loadingBar.isHidden = true
                    }
                    
                    //if let weather = self.parseJSON(safeData) {
                        //self.delegate?.didUpdateWeather(self, weather: weather)
                    //}
                }
            }
            //4. Start the task
            task.resume()
        }
        
    }
    
    
}

