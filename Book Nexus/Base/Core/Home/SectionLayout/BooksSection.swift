//
//  BooksSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit

class BooksSection: CollectionViewSectionDelegate{
    typealias Response = Book
    
    var items: [Response] = [
        Book(),
        Book(),
        Book(),
        Book(),
        Book(),
        Book(),
        
    ]

    var itemsCount: Int = 0
    
    var title: String?
    
    init(){
        self.itemsCount = items.count
    }
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(135), heightDimension: .absolute(220))
        
    func itemLayout() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: self.itemSize)
    }
    
    func groupLayout() -> NSCollectionLayoutGroup {
        let group =  NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, repeatingSubitem: self.itemLayout(), count: 1)
        group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        return group
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.groupLayout())
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CartCell.self, for: indexpath)
        return cell

    }
    
}
