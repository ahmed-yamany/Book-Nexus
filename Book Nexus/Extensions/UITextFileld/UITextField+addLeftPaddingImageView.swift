//
//  UITextField+addLeftPaddingImageView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 25/01/2023.
//

import UIKit

extension UITextField{
    func addLeftPaddingImageView(_ imageView: UIImageView , width: CGFloat, height: CGFloat, rightPadding: CGFloat){

        let view = UIView()
        view.addSubview(imageView)
        view.sizeConstraints(width: width, height: height)
        imageView.centerYInSuperview()
        imageView.makeConstraints(trailingAnchor: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightPadding))
        self.leftView = view
        self.leftViewMode = .always

    }
}

