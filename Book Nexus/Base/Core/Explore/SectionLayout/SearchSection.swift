//
//  SearchSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 24/01/2023.
//

import UIKit

final class SearchSection: CollectionViewSectionDelegate{
    typealias Response = String

    var items: [String] = []
    
    var itemsCount: Int = 1
    
    var title: String?
    
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45))
    
    var supplementaryViewSize: NSCollectionLayoutSize?
    
    init(){
        
    }
    
    func itemLayout() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: self.itemSize)
    }
    
    func groupLayout() -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitems: [self.itemLayout()])
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.groupLayout())
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    func cellForItem(_ collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SearchCell.self, for: indexpath)
        
        return cell
    }
    
    func networkRequest(_ collection: UICollectionView) {
        collection.reloadData()
    }
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(cell: SearchCell.self)
    }
    
    
    
}
