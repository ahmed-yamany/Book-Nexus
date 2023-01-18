//
//  CircledImageView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class CircledImageView: UIImageView {
    init(image: UIImage?, width: CGFloat) {
        super.init(image: image)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = width / 2
        equalSizeConstraints(width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
