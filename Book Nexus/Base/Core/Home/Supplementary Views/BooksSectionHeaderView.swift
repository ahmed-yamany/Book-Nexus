//
//  BooksSectionHeaderView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 21/01/2023.
//

import UIKit

class BooksSectionHeaderView: UICollectionReusableView{
    static let identifier = String(describing: BooksSectionHeaderView.self)
    
    var name: UILabel = {
        let label = UILabel()
        label.text = "Trending"
        label.textColor = ColorsManager.textColor
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let showAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        let label = UILabel()
        label.text = "Show all"
        label.textColor = ColorsManager.accentGreen
        label.font = .systemFont(ofSize: 14, weight: .light)
        
        let image = UIImageView(image: UIImage(systemName: "arrow.right.circle.fill"))
        image.tintColor = ColorsManager.accentGreen
        image.equalSizeConstraints(14)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(image)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(name)
        name.centerYInSuperview()
        name.makeConstraints(leadingAnchor: leadingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        addSubview(showAll)
        showAll.centerYInSuperview()
        showAll.makeConstraints(trailingAnchor: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String?, action: Selector?){
        self.name.text = title
        showAll.addGestureRecognizer(UITapGestureRecognizer(target: self, action: action))
    }
}
