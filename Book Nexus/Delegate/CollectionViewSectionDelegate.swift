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
    var supplementaryViewSize: NSCollectionLayoutSize? {get set}
    
    func itemLayout() -> NSCollectionLayoutItem
    func groupLayout() -> NSCollectionLayoutGroup
    func sectionLayout() -> NSCollectionLayoutSection
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem?

    func cellForItem(_ collectionView: UICollectionView, at indexpath: IndexPath) -> UICollectionViewCell
    func viewForSupplementaryElementOfKind(_ collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView?
    
    
    func networkRequest(_ collection: UICollectionView)
    
    func didSelectItem(_ viewController: UIViewController, at indexPath: IndexPath)
    
    func register(_ collectionView: UICollectionView)
}

extension CollectionViewSectionDelegate{    
    func sectionSupplementaryLayout(elementKind: String, alignment: NSRectAlignment) -> NSCollectionLayoutBoundarySupplementaryItem? {
        return nil
    }
    
    func viewForSupplementaryElementOfKind(_ collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionReusableView? {
        nil
    }
    
    func didSelectItem(_ viewController: UIViewController, at indexPath: IndexPath) {}

}


