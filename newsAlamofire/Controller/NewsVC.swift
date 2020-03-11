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
    
    var getNewFromJSON = GetNewsFromJSON()
    var nomeCitta : String?
    var inizialeCitta : String?
    var arrayTitle : [String] = []
    var arrayImage : [String] = []
    var arrayURL : [String] = []
    var arrayLink : [String] = []
    var arrayAuthors : [String] = []
   // let news = News()
//    let APP_ID = "d1100591b9054c3da2fef23e4c9a2a15"
//    let MY_URL = "https://newsapi.org/v2/top-headlines?country="
   
    
   // var count = 0
    @IBOutlet weak var newsCollection: UICollectionView!
    @IBOutlet weak var cityTitleLbl: UILabel!
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // overrideUserInterfaceStyle is available with iOS 13
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        newsCollection.delegate = self
        newsCollection.dataSource = self
        getNewFromJSON.delegate = self
        cityTitleLbl.text = nomeCitta
        getNewFromJSON.getJSON(forCity: inizialeCitta!)
        //startJSON()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        newsCollection.reloadData()
    }
    
//let new = "https://newsapi.org/v2/top-headlines?country=us&=d1100591b9054c3da2fef23e4c9a2a15"
//  let old = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d1100591b9054c3da2fef23e4c9a2a15"
    
    
//    func startJSON (){
//       let params : [String : String] = ["apiKey" : APP_ID]
//        getWeatherData(url: MY_URL + inizialeCitta! , parameters: params)
//    }
//
//
//    func getWeatherData(url: String, parameters: [String:String]){
//
//        AF.request(url, method: .get, parameters:parameters).responseJSON{
//            response in
//
//            switch response.result{
//            case .success(let value):
//                print("Success! Got the News data")
//                let json = JSON(arrayLiteral: value)
//                self.updateNewsData(json: json)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//
//    func updateNewsData(json : JSON){
//
//        let articles = json[0]["articles"].count
//
//        for i in 0...articles - 1 {
//            let image = json[0]["articles"][i]["urlToImage"].stringValue
//            let title = json[0]["articles"][i]["title"].stringValue
//            let url = json[0]["articles"][i]["url"].stringValue
//           // let link = json[0]["articles"][i]["url"]
//             arrayTitle.append(title)
//             arrayImage.append(image)
//             arrayURL.append(url)
//        }
//        //let author = json[0]["articles"][0]["author"].stringValue
//        //let descriptions = json[0]["articles"][0]["descriprion"].stringValue
//        self.newsCollection.reloadData()
//
//    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showSafariVC(url : String){
    guard let url = URL(string : url) else { return }
    
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true)
    }
    
}


//MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension NewsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell
        let indexTitle = arrayTitle[indexPath.row]
        let indexImage = arrayImage[indexPath.row]
        let indexLink = arrayURL[indexPath.row]
        let author = arrayAuthors[indexPath.row]
      
        cell?.setupTable(title : indexTitle, image: indexImage, link: indexLink,auth: author)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showSafariVC(url: arrayURL[indexPath.row])
    }
    
    
    
}

//MARK: - GetJSONDelegate
extension NewsVC: GetJSONDelegate{
    func getArrayTitle(_ title: [String]) {
        arrayTitle = title
        newsCollection.reloadData()
    }
    
    func getArrayImage(_ image: [String]) {
        arrayImage = image
        newsCollection.reloadData()
    }
    
    func getArrayURL(_ url: [String]) {
        arrayURL = url
        newsCollection.reloadData()
    }
    
    func getArrayAuthors(_ authors: [String]) {
        arrayAuthors = authors
        newsCollection.reloadData()
    }
    
}
