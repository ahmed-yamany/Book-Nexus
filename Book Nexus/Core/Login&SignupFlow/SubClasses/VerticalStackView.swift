//
//  VerticalStackView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class VerticalStackView: UIStackView{
    init(){
        super.init(frame: .zero)
        axis = .vertical
        spacing = 10
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func updateArrangedSubviewsLayout(ignor: [UIView] = []){
        arrangedSubviews.forEach { view in
            if !ignor.contains(view){
                view.heightConstraints(48)
                view.layer.cornerRadius = 8
            }
        }

    }
}
