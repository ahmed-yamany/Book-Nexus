//
//  SocialMediaButton.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class SocialMediaButton: UIButton{
    init(_ title: String, with image: UIImage?){
        super.init(frame: .zero)
        
        backgroundColor = .white
        setTitle(title, for: .normal)
        setTitleColor(ColorsManager.accentBlack, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        // Create an image view with the specified image and add it to the button
        let imageView = UIImageView(image: image)
        addSubview(imageView)
        
        // Constrain the image view to be centered on the y-axis of the button and have a leading edge 20 points from the leading edge of the button
        imageView.centerYInSuperviewConstraints()
        imageView.makeConstraints(leadingAnchor: leadingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
