//
//  StoryCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class StoryCell: UICollectionViewCell {
    let image = CircledImageView(image: UIImage(named: "profle"), width: 200)
    
    init() {
        super.init(frame: .zero)
        
        addSubview(image)
        image.fillSuperviewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
