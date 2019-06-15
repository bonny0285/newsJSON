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
import SafariServices




class NewsVC: UIViewController {
    var nomeCitta : String?
    var inizialeCitta : String?
    let APP_ID = "d1100591b9054c3da2fef23e4c9a2a15"
    let MY_URL = "https://newsapi.org/v2/top-headlines?country="
   
    
    var count = 0
    @IBOutlet weak var newsCollection: UICollectionView!
    
    
    @IBOutlet weak var cityTitleLbl: UILabel!
    var arrayTitle : [String] = []
    var arrayImage : [String] = []
    var arrayURL : [String] = []
    let news = News()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cazzoooooo",inizialeCitta!)
        newsCollection.delegate = self
        newsCollection.dataSource = self
        cityTitleLbl.text = nomeCitta
        startJSON()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        newsCollection.reloadData()
       // startJSON()
    }
let new = "https://newsapi.org/v2/top-headlines?country=us&=d1100591b9054c3da2fef23e4c9a2a15"
  let old = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d1100591b9054c3da2fef23e4c9a2a15"
    
    
    func startJSON (){
       let params : [String : String] = ["apiKey" : APP_ID]
        getWeatherData(url: MY_URL + inizialeCitta! , parameters: params)
    }
    
    
    func getWeatherData(url: String, parameters: [String:String]){
        Alamofire.request(url, method: .get, parameters:parameters).responseJSON{
            response in
            if response.result.isSuccess{
                //print(response.request?.description)
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
             var url = json["articles"][i]["url"].stringValue
             arrayTitle.append(title)
             arrayImage.append(image)
             arrayURL.append(url)
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
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showSafariVC(url : String){
    guard let url = URL(string : url) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showSafariVC(url: arrayURL[indexPath.row])
    }
    
    
    
}

