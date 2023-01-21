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
    var itemsCount: Int {get set}

    var title: String? {get set}
    
    var itemSize: NSCollectionLayoutSize {get set}
    var groupSize: NSCollectionLayoutSize {get set}
    
    func itemLayout() -> NSCollectionLayoutItem
    func groupLayout() -> NSCollectionLayoutGroup
    func sectionLayout() -> NSCollectionLayoutSection
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem?

    func cellForItem(collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView?
    
    
    func networkRequest(collection: UICollectionView)
}

