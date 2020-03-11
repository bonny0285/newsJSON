//
//  GetNewsFromJSON.swift
//  newsAlamofire
//
//  Created by Massimiliano on 11/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


public protocol GetJSONDelegate: class {
    func getArrayTitle(_ title: [String])
    func getArrayImage(_ image: [String])
    func getArrayURL(_ url: [String])
    func getArrayAuthors(_ authors: [String])
}

public struct GetNewsFromJSON{
    
    public var delegate: GetJSONDelegate?
    
    public func getJSON(forCity inizialeCitta: String?){
        let APP_ID = "d1100591b9054c3da2fef23e4c9a2a15"
        let MY_URL = "https://newsapi.org/v2/top-headlines?country="
        let params : [String : String] = ["apiKey" : APP_ID]
        parseJSON(forURL:MY_URL + inizialeCitta!,withParameters: params)
    }
    
    private func parseJSON(forURL url: String?,withParameters parameters: [String:String]){
        
        AF.request(url!, method: .get, parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success(let value):
                print("Success! Got the News data")
                let json = JSON(arrayLiteral: value)
                self.updateNewsData(json: json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func updateNewsData(json : JSON){
        print("CI SIAMO")
        
        var arrayTitle: [String] = []
        var arrayImage: [String] = []
        var arrayURL: [String] = []
        var arrayAuthors: [String] = []
        let articles = json[0]["articles"].count
        
        for i in 0...articles - 1 {
            let image = json[0]["articles"][i]["urlToImage"].stringValue
            let title = json[0]["articles"][i]["title"].stringValue
            let url = json[0]["articles"][i]["url"].stringValue
            let auth = json[0]["articles"][i]["source"]["name"].stringValue
            // let link = json[0]["articles"][i]["url"]
            arrayTitle.append(title)
            arrayImage.append(image)
            arrayURL.append(url)
            arrayAuthors.append(auth)
        }
        
        delegate?.getArrayTitle(arrayTitle)
        delegate?.getArrayImage(arrayImage)
        delegate?.getArrayURL(arrayURL)
        delegate?.getArrayAuthors(arrayAuthors)
        //let author = json[0]["articles"][0]["author"].stringValue
        //let descriptions = json[0]["articles"][0]["descriprion"].stringValue
        
        
    }
}
