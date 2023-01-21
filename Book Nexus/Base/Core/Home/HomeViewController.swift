//
//  HomeCollectionViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit
import SwiftUI

class HomeViewController: UICollectionViewController {
    
    lazy var sections: [any CollectionViewSectionDelegate] = [
        StoriesSection(),
        CategoriesSection(),
        CardSection(),
        BooksSection(title: "Trending"),
        BooksSection(title: "5-Minutes read")
    ]
    
    let musicView = UIView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: .black)
        
        collectionView.showsVerticalScrollIndicator = false
        // Register cells
        collectionView.register(cell: StoryCell.self)
        collectionView.register(cell: CategoriesCell.self)
        collectionView.register(cell: CartCell.self)
        collectionView.register(cell: BookCell.self)
        // Register supplementary views
        collectionView.register(BooksSectionHeaderView.self, forSupplementaryViewOfKind: BooksSectionHeaderView.identifier, withReuseIdentifier: BooksSectionHeaderView.identifier)
        
        
        
        collectionView.collectionViewLayout = self.collectionViewLayout()
        
        self.sections.forEach({$0.networkRequest(collection: self.collectionView)})
        
        
        
        musicView.heightConstraints(70)
        musicView.backgroundColor = .red
        tabBarController?.tabBar.addSubview(musicView)
        musicView.fillXSuperViewConstraints()
        musicView.makeConstraints(bottomAnchor: tabBarController?.tabBar.topAnchor)
       
        
    }
    private func collectionViewLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { [ weak self]  sectionIndex, layoutEnvironment in
            let section = self?.sections[sectionIndex]
            return section?.sectionLayout()
        }
        return layout
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // I have tried to use currentSection.items.count but xcode gives me error i think this is a bug in xcode
        // So i declared a variable called itemsCount to use it insted of count of items
        let currentSection = self.sections[section]
        return currentSection.itemsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentSection = self.sections[indexPath.section]
        return currentSection.cellForItem(collectionView: collectionView, at: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        musicView.isHidden.toggle()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = self.sections[indexPath.section]
        guard let supplementaryElement = section.viewForSupplementaryElementOfKind(collectionView: collectionView, for: indexPath) else{return UICollectionReusableView()}
        return supplementaryElement
    }

    private func initialSetup() {
        collectionView.backgroundColor = ColorsManager.backgroudColor
        view.backgroundColor = ColorsManager.backgroudColor
        let item = UIBarButtonItem()
        
        item.customView = GoodAfterNoonView()
        navigationItem.leftBarButtonItem = item
       
        let righBarButton = UIBarButtonItem()
        righBarButton.customView = CircledImageView(image: UIImage(named: "profile"), width: 40)
        navigationItem.rightBarButtonItem = righBarButton
    }

}

