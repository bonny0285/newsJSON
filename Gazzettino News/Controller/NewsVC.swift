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
        
    UIApplication.shared.open(url)
//    let safariVC = SFSafariViewController(url: url)
//    present(safariVC, animated: true)
    }
    
}



//MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension NewsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell
        

      
            let indexTitle = self.arrayTitle[indexPath.row]
            let indexImage = self.arrayImage[indexPath.row]
            let indexLink = self.arrayURL[indexPath.row]
            let author = self.arrayAuthors[indexPath.row]
        
            

        
        
       DispatchQueue.main.async {
            
            cell?.setupTable(title : indexTitle, image: indexImage, link: indexLink,auth: author)
       }
        
       return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Attention!", message: "News from: \(self.arrayAuthors[indexPath.row])\n Do you want open: \(arrayURL[indexPath.row])?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            self.showSafariVC(url: self.arrayURL[indexPath.row])
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
}

//MARK: - GetJSONDelegate
extension NewsVC: GetJSONDelegate{
    func getArrayTitle(_ title: [String]) {
      //  DispatchQueue.main.async {
            self.arrayTitle = title
            self.newsCollection.reloadData()
      //  }
        
    }
    
    func getArrayImage(_ image: [String]) {
        //  DispatchQueue.main.async {
            self.arrayImage = image
            self.newsCollection.reloadData()
       // }
        
    }
    
    func getArrayURL(_ url: [String]) {
     //   DispatchQueue.main.async {
            self.arrayURL = url
            self.newsCollection.reloadData()
     //   }
        
    }
    
    func getArrayAuthors(_ authors: [String]) {
      //  DispatchQueue.main.async {
            self.arrayAuthors = authors
            self.newsCollection.reloadData()
       // }
        
    }
    
}
