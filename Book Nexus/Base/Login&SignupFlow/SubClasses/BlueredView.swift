//
//  BlueredView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

class BluredView: UIView {
    lazy var visualEffectView: UIVisualEffectView = {
            let blurEffect = UIBlurEffect(style: .systemMaterialDark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.alpha = 0.85
            visualEffectView.contentView.layer.cornerRadius = 15
            return visualEffectView
        }()
    
    // Initialize the view and add the visual effect view as a subview
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(visualEffectView)
        
        visualEffectView.fillSuperviewConstraints()
        layer.cornerRadius = 15
        clipsToBounds = true    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
