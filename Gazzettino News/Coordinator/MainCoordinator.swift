//
//  MainCoordinator.swift
//  newsAlamofire
//
//  Created by Massimiliano Bonafede on 10/09/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

protocol MainCoordinated: class {
    var mainCoordinator: MainCoordinator? { get set}
}


class MainCoordinator: NSObject {
    
    let mainNavigationController:  UINavigationController
    
    var newsManager = NewsManager()
    
    
    init(navigationController: UINavigationController) {
        self.mainNavigationController = navigationController
        super.init()
        
        if #available(iOS 13.0, *) {
            mainNavigationController.overrideUserInterfaceStyle = .light
        }
        
        configure(viewController: mainNavigationController)
    }
    
    
    func searchForNewsDidPressed(_ ricercaViewController: SearchViewController) {
        ricercaViewController.performSegue(withIdentifier: "ShowNews", sender: nil)
    }
    
    func cancelTapped(_ viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}


extension MainCoordinator: Coordinating {
    
    func configure(viewController: UIViewController) {
        (viewController as? MainCoordinated)?.mainCoordinator = self
        (viewController as? NewsManagerDelegate)?.newManager = newsManager
        
        if let navigationController = viewController as? UINavigationController, let rootViewController = navigationController.viewControllers.first {
            configure(viewController: rootViewController)
        }
    }
}

