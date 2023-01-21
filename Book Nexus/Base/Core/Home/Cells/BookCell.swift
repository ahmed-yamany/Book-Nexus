//
//  BookCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 21/01/2023.
//

import UIKit
import SwiftUI

class BookCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with book: Book){
        let hostingController = UIHostingController(rootView: BookView(book: book))
        guard let cell = hostingController.view else { return}
        
        contentView.addSubview(cell)
        cell.fillSuperviewConstraints()
        cell.backgroundColor = ColorsManager.backgroudColor
    }
}
