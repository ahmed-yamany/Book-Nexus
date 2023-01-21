//
//  CardSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit

class CardSection: CollectionViewSectionDelegate{
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem? {
        nil
    }
    
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView? {
        nil
    }
    
    
    
    typealias Response = String
    
    var items: [Response] = []

    var itemsCount: Int = 1
    
    var title: String?
    
    init() {
    }
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .absolute(200))
        
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
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CartCell.self, for: indexpath)
        return cell

    }
    func networkRequest(collection: UICollectionView) {
    }
    
    
}
