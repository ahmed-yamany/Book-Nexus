//
//  ExploreViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit


class ExploreViewController: CollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            collectionView.register(BooksSectionHeaderView.self, forSupplementaryViewOfKind: BooksSectionHeaderView.identifier, withReuseIdentifier: BooksSectionHeaderView.identifier)
    
        self.sections = [
        SearchSection(),
        TopicSection(),
        BooksSection(title: "Fiction"),
        BooksSection(title: "Culture & Society"),
        BooksSection(title: "Life style")
        ]
        
        
        self.sections.forEach({$0.register(self.collectionView)})
        self.sections.forEach({$0.networkRequest(collectionView)})

    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        let exploreLabel = UILabel()
        exploreLabel.text = "Explore"
        exploreLabel.textColor = .white
        exploreLabel.font = .systemFont(ofSize: 26, weight: .bold)
        
        
        let bottomLine = UIView()
        exploreLabel.addSubview(bottomLine)
        bottomLine.fillXSuperViewConstraints()
        bottomLine.heightConstraints(2)
        bottomLine.makeConstraints(bottomAnchor: exploreLabel.bottomAnchor)
        bottomLine.backgroundColor = ColorsManager.accentGreen
        
        
        let leftBarButtonItem  = UIBarButtonItem()
        leftBarButtonItem.customView = exploreLabel

        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
}
