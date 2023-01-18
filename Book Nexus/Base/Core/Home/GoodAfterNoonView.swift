//
//  GoodAfterNoonView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

final class GoodAfterNoonView: UIView {
     init() {
         super.init(frame: .zero)
         
         let goodLabel = UILabel()
         goodLabel.text = "Good"
         goodLabel.textColor = .white
         goodLabel.font = .systemFont(ofSize: 26, weight: .bold)
         
         let afternoonLabel = UILabel()
         afternoonLabel.text = "Afternoon"
         afternoonLabel.textColor = .white
         afternoonLabel.font = .systemFont(ofSize: 26, weight: .bold)
         
         widthConstraints(200)
         heightConstraints(30)
     
         addSubview(goodLabel)
         addSubview(afternoonLabel)
         
         goodLabel.makeConstraints(leadingAnchor: leadingAnchor)
         goodLabel.centerYInSuperview()

         afternoonLabel.makeConstraints(trailingAnchor: trailingAnchor)
         afternoonLabel.centerYInSuperview()
         
         let smileVectorImageView = UIImageView(image: ImageManager.smileVector)
         addSubview(smileVectorImageView)
         smileVectorImageView.makeConstraints(topAnchor: bottomAnchor,
                                              leadingAnchor: goodLabel.leadingAnchor, trailingAnchor: goodLabel.trailingAnchor)
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
