//
//  CollectionViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 22/01/2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var sections: [any CollectionViewSectionDelegate] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.setupNavigationBar()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = self.collectionViewLayout()
    }
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [ weak self]  sectionIndex, layoutEnvironment in
            let section = self?.sections[sectionIndex]
            return section?.sectionLayout()
        }
        return layout
    }
    
    func initialSetup() {
        collectionView.backgroundColor = ColorsManager.backgroudColor
        view.backgroundColor = ColorsManager.backgroudColor
    }
    
    func getSection(at indexPath: IndexPath) -> any CollectionViewSectionDelegate {
        return self.sections[indexPath.section]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // I have tried to use currentSection.items.count but xcode gives me error i think this is a bug in xcode
        // So i declared a variable called itemsCount to use it insted of count of items
        let currentSection = self.sections[section]
        return currentSection.itemsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.getSection(at: indexPath)
        return section.cellForItem(collectionView, at: indexPath)
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = self.getSection(at: indexPath)
        guard let supplementaryElement = section.viewForSupplementaryElementOfKind( collectionView, for: indexPath) else{return UICollectionReusableView()}
        return supplementaryElement
    }

    
    
    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .black), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: .black)
        
    }

}

