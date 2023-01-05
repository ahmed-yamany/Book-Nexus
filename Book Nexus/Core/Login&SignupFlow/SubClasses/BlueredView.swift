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
        bluredEffectView.alpha = 0.95
        bluredEffectView.fillSuperviewConstraints()
        bluredEffectView.contentView.layer.cornerRadius = 15
    }
    
    
    public func updateLayoute(){
        centerXInSuperviewConstraints()
        fillXSuperViewConstraints(paddingLeft: 20, paddingRight: 20)
        guard let superview = superview else{return}
        makeConstraints(top: superview.topAnchor, padding: UIEdgeInsets(top: superview.frame.height/3, left: 0, bottom: 0, right: 0 ))

    }
}
