//
//  CollectionViewSection.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

protocol CollectionViewSectionDelegate: AnyObject {
    associatedtype Response
    var items: [Response] {get set}
    var title: String? {get set}
    
    var itemSize: NSCollectionLayoutSize {get set}
    var groupSize: NSCollectionLayoutSize {get set}
    
    func item() -> NSCollectionLayoutItem
    func group() -> NSCollectionLayoutGroup
    func Layout() -> NSCollectionLayoutSection
    
    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell
}
