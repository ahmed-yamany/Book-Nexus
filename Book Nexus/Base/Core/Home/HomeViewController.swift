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
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        
        collectionView.register(cell: StoryCell.self)
        collectionView.register(cell: CategorieCell.self)
        collectionView.collectionViewLayout = self.collectionViewLayout()

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

