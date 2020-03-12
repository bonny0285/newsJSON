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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        newsCollection.reloadData()
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


//MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension NewsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell
        
      
        DispatchQueue.main.async {
            let indexTitle = self.arrayTitle[indexPath.row]
            let indexImage = self.arrayImage[indexPath.row]
            let indexLink = self.arrayURL[indexPath.row]
            let author = self.arrayAuthors[indexPath.row]
            cell?.setupTable(title : indexTitle, image: indexImage, link: indexLink,auth: author)
        }
        
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
