//
//  StoriesSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class StoriesSection: CollectionViewSectionDelegate{
    typealias Response = String
    var title: String? = "hi"
    var items: [String] = []
    
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(300))
    
    init(title: String? = nil) {
        self.title = title
    }
    
    func item() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: self.itemSize)
    }
    
    func group() -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitems: [self.item()])
    }
    
    func Layout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.group())
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexpath) as? StoryCell else{
            return UICollectionViewCell()
        }
        
        return cell        
    }
    
    
    
}
