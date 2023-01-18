//
//  HomeCollectionViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        
    }
    private func initialSetup() {
        collectionView.backgroundColor = .black
        let item = UIBarButtonItem()
        
        item.customView = GoodAfterNoonView()
        navigationItem.leftBarButtonItem = item
       
        let righBarButton = UIBarButtonItem()
        righBarButton.customView = CircledImageView(image: UIImage(named: "profile"), width: 40)
        navigationItem.rightBarButtonItem = righBarButton
    }

}
