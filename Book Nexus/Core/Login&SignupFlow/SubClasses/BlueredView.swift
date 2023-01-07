//
//  BlueredView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

class BluredView: UIView{
    // Create a blure effect and a visual effect view with the blur effect
    lazy var blurEffect = UIBlurEffect(style: .systemMaterialDark)
    lazy var visualEffectView = UIVisualEffectView(effect: blurEffect)
    
    // Initialize the view and add the visual effect view as a subview
    override init(frame: CGRect){
        super.init(frame: .zero)
        layoutVisualEffectView()
        
        // Set the corner radius and enable clipping of the view's content
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Add the visual effect view as a subview to the view and set its layout
    private func layoutVisualEffectView(){
        addSubview(visualEffectView)
        
        visualEffectView.alpha = 0.85
        visualEffectView.fillSuperviewConstraints()
        visualEffectView.contentView.layer.cornerRadius = 15
    }
    
}
