//
//  TopicsSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 26/01/2023.
//

import UIKit


class TopicSection: CollectionViewSectionDelegate {
    typealias Response = TopicModel
    
    var items: [TopicModel] = []
    var itemsCount: Int = 1
    
    var title: String? = "Topics"
    
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
    
    var supplementaryViewSize: NSCollectionLayoutSize? = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55))
    
    init(){ }
    
    func itemLayout() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(layoutSize: self.itemSize)
    }
    
    func groupLayout() -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitems: [self.itemLayout()])
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.groupLayout())
        let supplementaryItem = self.sectionSupplementaryLayout(elementKind: BooksSectionHeaderView.identifier, alignment: .top)

        if let supplementaryItem = supplementaryItem{
            section.boundarySupplementaryItems = [supplementaryItem]
        }

        return section
    }
    
    func cellForItem(_ collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: TopicsCell.self, for: indexpath)
        cell.setup()
        return cell
    }
    
    func networkRequest(_ collection: UICollectionView) {
        
    }
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(TopicsCell.self, forCellWithReuseIdentifier: TopicsCell.identifier)
    }
    
    
    func viewForSupplementaryElementOfKind(_ collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView? {
        let supplementaryIdentifier = BooksSectionHeaderView.identifier
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: supplementaryIdentifier, withReuseIdentifier: supplementaryIdentifier, for: indexPath) as? BooksSectionHeaderView else{return UICollectionReusableView()}
        
        view.setup(title: self.title, action: nil)
        return view

    }
    
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem? {
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: self.supplementaryViewSize!, elementKind: elementKind, alignment: alignment)
    }
    
    
}
