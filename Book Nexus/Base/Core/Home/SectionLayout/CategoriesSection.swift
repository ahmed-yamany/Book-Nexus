//
//  CategoriesSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit

class CategoriesSection: CollectionViewSectionDelegate{
    typealias Response = Category
    
    var items: [Category] = [
        Category(name: "Trending", image: "flame", action: {print("hello ")}),
            Category(name: "5-Minutes Read", image: "book"),
            Category(name: "Quick Listen", image: "headphones"),
        ]
    
    var itemsCount: Int = 0
    
    var title: String? = nil
    
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(43))
    
    init() {
        itemsCount = 1
    }
    
    func itemLayout() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: self.itemSize)
    }
    
    func groupLayout() -> NSCollectionLayoutGroup {
        let group =  NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, repeatingSubitem: self.itemLayout(), count: 1)
        return group
        
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.groupLayout())
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CategoriesCell.self, for: indexpath)
        cell.setup(with: self.items)
        return cell
    }
    
    
}
