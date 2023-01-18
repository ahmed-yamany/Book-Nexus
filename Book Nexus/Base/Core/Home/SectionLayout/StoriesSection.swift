//
//  StoriesSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class StoriesSection: CollectionViewSectionDelegate{
    typealias Response = Story
    var title: String? = "hi"
    var items: [Story] = [
        Story(image: UIImage(named: "book1"), title: "Royryan Marcove"),
        Story(image: UIImage(named: "book2"), title: "Neil Gaiman"),
        Story(image: UIImage(named: "book3"), title: "Mark mcallister"),
        Story(image: UIImage(named: "book4"), title: "Michael Doug"),
        Story(image: UIImage(named: "book1"), title: "Royryan Marcove"),
        Story(image: UIImage(named: "book2"), title: "Neil Gaiman"),
        Story(image: UIImage(named: "book3"), title: "Mark mcallister"),
        Story(image: UIImage(named: "book4"), title: "Michael Doug"),
        Story(image: UIImage(named: "book1"), title: "Royryan Marcove"),
        Story(image: UIImage(named: "book2"), title: "Neil Gaiman"),
        Story(image: UIImage(named: "book3"), title: "Mark mcallister"),
        Story(image: UIImage(named: "book4"), title: "Michael Doug"),
        

    ]
    
    var itemsCount: Int = 0
    
    var itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(40), heightDimension: .fractionalHeight(1))
    var groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(105))
    
    init(title: String? = nil) {
        self.title = title
        self.itemsCount = self.items.count
    }
    
    func itemLayout() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: self.itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return item
    }
    
    func groupLayout() -> NSCollectionLayoutGroup {
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: self.groupSize, subitem: self.itemLayout(), count: 4)
        return group
    }
    
    func sectionLayout() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: self.groupLayout())
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexpath) as? StoryCell else{
            return UICollectionViewCell()
        }
        let story = self.items[indexpath.row]
        cell.setup(with: story)
        return cell        
    }
}
