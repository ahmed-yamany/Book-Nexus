//
//  BlueredView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit

class BluredView: UIView{
    lazy var blurEffect = UIBlurEffect(style: .systemMaterialDark)
    lazy var bluredEffectView = UIVisualEffectView(effect: blurEffect)
    
    init(){
        super.init(frame: .zero)
        layoutBluerEffectView()
        
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutBluerEffectView(){
        addSubview(bluredEffectView)
        bluredEffectView.alpha = 0.9
        bluredEffectView.fillSuperviewConstraints()
        bluredEffectView.contentView.layer.cornerRadius = 15
    }
    
}
