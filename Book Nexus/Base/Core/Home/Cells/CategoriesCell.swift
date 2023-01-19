//
//  CategorieCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit
import SwiftUI

class CategoriesCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with categories: [Category]){
        let hostingController = UIHostingController(rootView: CategoriesView(categories: categories))
        guard let cell = hostingController.view else { return}
        
        self.contentView.addSubview(cell)
        cell.fillXSuperViewConstraints()
        cell.centerYInSuperview()
        cell.backgroundColor = .black
    }
    
 
}
