//
//  GeneryCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 08/01/2023.
//

import UIKit
import SwiftUI

class GeneryCell: UICollectionViewCell {
    // MARK: - Subviews
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .green
        label.backgroundColor = .red
        return label
    }()
    
    let icon: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "plus.circle")
        imageView.tintColor = .white
       return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            contentView.addSubview(nameLabel)
//            contentView.addSubview(icon)
//            layer.cornerRadius = 8
//            layer.borderWidth = 1
//            layer.borderColor = UIColor.white.cgColor
//
//        nameLabel.centerYInSuperviewConstraints()
        nameLabel.centerInSuperview()
//        nameLabel.makeConstraints(leadingAnchor: leadingAnchor)
//
//        icon.centerYInSuperviewConstraints()
//        icon.makeConstraints(trailingAnchor: trailingAnchor)
//
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
