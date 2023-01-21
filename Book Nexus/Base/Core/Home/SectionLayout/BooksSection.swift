//
//  BooksSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit

class BooksSection: CollectionViewSectionDelegate{
    
    
    typealias Response = Book
    
    var items: [Response] = []

    var itemsCount: Int = 0
    
    var title: String?
    
    init(title: String? = nil){
        self.title = title
        self.itemsCount = items.count
    }
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(245))
        
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
        
        let supplementaryItem = self.sectionSupplementaryLayout(elementKind: BooksSectionHeaderView.identifier, alignment: .top)
        if let supplementaryItem = supplementaryItem{
            section.boundarySupplementaryItems = [supplementaryItem]
        }
        
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: BookCell.self, for: indexpath)
        cell.setup(with: self.items[indexpath.row])
        return cell

    }
    func networkRequest(collection: UICollectionView) {
        self.items = [
            Book(image: "book2", name: "The good guy", authorName: "Mark mcallister", minutesToListen: 5, minutesToRead: 8),
            Book(image: "book3", name: "Futurama", authorName: "Michael Douglas jr.", minutesToListen: 12, minutesToRead: 9),
            Book(image: "book1", name: "Explore your create mind to positivity", authorName: "Royryan Mercado", minutesToListen: 15, minutesToRead: 15)
        ]
        self.itemsCount = self.items.count
    }
    
    
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView? {
        let supplementaryIdentifier = BooksSectionHeaderView.identifier
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: supplementaryIdentifier, withReuseIdentifier: supplementaryIdentifier, for: indexPath) as? BooksSectionHeaderView else{return UICollectionReusableView()}
        
        view.setup(title: self.title, action: nil)
        return view

    }
    
    
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem?{
        let supplementarySize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementarySize, elementKind: elementKind, alignment: alignment)
    }

    
}
