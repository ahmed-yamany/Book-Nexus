//
//  HomeCollectionViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class HomeViewController: CollectionViewController {
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerSupplementaryViews()
        self.setupNavigationBar()
        
        self.sections = [
            StoriesSection(),
            CategoriesSection(),
            CardSection(),
            BooksSection(title: "Trending"),
            BooksSection(title: "5-Minutes read")
        ]
        
        self.registerCells()
        self.sections.forEach({$0.networkRequest(collectionView)})
    }
    
    private func registerCells() {
        self.sections.forEach({$0.register(collectionView)})
    }
    
    private func registerSupplementaryViews() {
        collectionView.register(BooksSectionHeaderView.self, forSupplementaryViewOfKind: BooksSectionHeaderView.identifier, withReuseIdentifier: BooksSectionHeaderView.identifier)
    }
    
    override func setupNavigationBar(){
        super.setupNavigationBar()
        
        let item = UIBarButtonItem()
        item.customView = GoodAfterNoonView()
        navigationItem.leftBarButtonItem = item
        
        let righBarButton = UIBarButtonItem()
        righBarButton.customView = CircledImageView(image: UIImage(named: "profile"), width: 40)
        navigationItem.rightBarButtonItem = righBarButton
    
    }
  
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = self.getSection(at: indexPath)
        section.didSelectItem(self, at: indexPath)
        
    }
    

}

