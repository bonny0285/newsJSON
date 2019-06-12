//
//  ViewController.swift
//  newsAlamofire
//
//  Created by Massimiliano on 11/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class NewsVC: UIViewController {

    let APP_ID = "d1100591b9054c3da2fef23e4c9a2a15"
    let MY_URL = "https://newsapi.org/v2/top-headlines?country=it"
   // let params : [String : String] = ["apiKey" : APP_ID]
    
    var count = 0
    @IBOutlet weak var newsCollection: UICollectionView!
    
    
    var arrayTitle : [String] = []
    var arrayImage : [String] = []
    let news = News()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollection.delegate = self
        newsCollection.dataSource = self
        startJSON()
    }
let new = "https://newsapi.org/v2/top-headlines?country=us&=d1100591b9054c3da2fef23e4c9a2a15"
  let old = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d1100591b9054c3da2fef23e4c9a2a15"
    
    
    func startJSON (){
        let params : [String : String] = ["apiKey" : APP_ID]
        getWeatherData(url: MY_URL, parameters: params)
    }
    
    
    func getWeatherData(url: String, parameters: [String:String]){
        Alamofire.request(url, method: .get, parameters:parameters).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success! Got the weather data")
                let newsJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData(json: newsJSON)
            }
            else{
                print("Error \(String(describing: response.result.error))")
               // self.locationLbl.text = "Connection Issue"
            }
        }
    }
    
    
    func updateWeatherData(json : JSON){
        var articles = json["articles"].count
        for i in 0...19 {
             var image = json["articles"][i]["urlToImage"].stringValue
             var title = json["articles"][i]["title"].stringValue
             arrayTitle.append(title)
             arrayImage.append(image)
        }
        var author = json["articles"][0]["author"].stringValue
        
        
        var descriptions = json["articles"][0]["descriprion"].stringValue
       
        //var articles = json["articles"].count
        print("ARTICOLI",articles)
        
        print(arrayTitle)
        print(news.author)
        print(news.title)
        print(news.descriptions)
        print(news.urlToImage)
        print(news.articles)
        self.newsCollection.reloadData()

    }
}
extension NewsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell
        let indexTitle = arrayTitle[indexPath.row]
        let indexImage = arrayImage[indexPath.row]
        print("tableView", arrayTitle)
        print("index", index)
        cell?.setupTable(title : indexTitle, image: indexImage)
        return cell!
    }
    
    
}

