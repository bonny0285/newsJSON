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




class NewsViewController: UIViewController, MainCoordinated, NewsManagerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityTitleLbl: UILabel!
    
    //MARK: - Properties
    var mainCoordinator: MainCoordinator?
    var newManager: NewsManager?
    var getNewsFromJSON: GetNewsFromJSON?
    var dataSource: NewsDataSource?
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // overrideUserInterfaceStyle is available with iOS 13
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        collectionView.delegate = self
        
        
        getNewsFromJSON = GetNewsFromJSON()
        getNewsFromJSON?.delegate = self
        getNewsFromJSON?.retriveNewsFromServer((newManager?.inizialeCittà)!)
        cityTitleLbl.text = newManager?.nomeCittà
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showSafariVC(url : String) {
        guard let url = URL(string : url) else { return }
        
        UIApplication.shared.open(url)
        //    let safariVC = SFSafariViewController(url: url)
        //    present(safariVC, animated: true)
    }
    
}


//MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension NewsViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let auth = dataSource?.getAuthor(at: indexPath) else { return }
        guard let url = dataSource?.getURL(at: indexPath) else { return }
        
        let alertController = UIAlertController(title: "Attention!", message: "News from: \(auth)\n Do you want open: \(url)?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }
            self.showSafariVC(url: url)
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
}


extension NewsViewController: FetchedNewDidSuccessfullyDelegate {
    func retriveNews(_ news: [News]) {
        self.newsContainer = news
        dataSource = NewsDataSource(news: news)
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
    func retriveNewsDidFail(_ error: String) {
        debugPrint(error)
    }
}

