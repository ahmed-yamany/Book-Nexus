//
//  SearchCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 24/01/2023.
//

import UIKit

final class SearchCell: UICollectionViewCell {
    
    private let textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTextField()
        self.addImageViewToTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField(){
        textField.attributedPlaceholder = NSAttributedString(string: "Title, author or keyword", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.systemGray3])
        textField.backgroundColor = UIColor(red: 98/255, green: 102/255, blue: 102/255, alpha: 1)
        
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = ColorsManager.accentGreen.cgColor
        
        textField.layer.cornerRadius = 8
        contentView.addSubview(textField)
        textField.fillSuperviewConstraints()
    }
    
    
    private func addImageViewToTextField() {
        let imageview = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imageview.sizeConstraints(width: 20, height: 20)
        imageview.tintColor = .white
        
        textField.addLeftPaddingImageView(imageview, width: 40, height: 20, rightPadding: 5)
    }
    
}



