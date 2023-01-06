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
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let imageView = UIImageView(image: image)
        addSubview(imageView)
        imageView.centerYInSuperviewConstraints()
        imageView.makeConstraints(leading: leadingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
