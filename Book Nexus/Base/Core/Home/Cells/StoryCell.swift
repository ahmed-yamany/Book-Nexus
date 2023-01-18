//
//  StoryCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 18/01/2023.
//

import UIKit

class StoryCell: UICollectionViewCell {
    // Declare and initialize the image view
    lazy var image = CircledImageView(image: nil, width: frame.width-10)
    // Declare and initialize the title label of the story
    let title: UILabel = {
        let label = UILabel()
        label.textColor = ColorsManager.textColor
        label.font = .systemFont(ofSize: 16, weight: .light, width: .standard)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        
        // Add the container view
        let imageContainerView = UIView()
        imageContainerView.backgroundColor = .white
        let imagecontainerViewWidth: CGFloat = frame.width - 5
        imageContainerView.equalSizeConstraints(imagecontainerViewWidth)
        imageContainerView.layer.cornerRadius = imagecontainerViewWidth / 2
        
        self.addSubview(imageContainerView)
        imageContainerView.centerXInSuperview()
        imageContainerView.makeConstraints(topAnchor: topAnchor)

        // Add the image view to the container view
        imageContainerView.addSubview(image)
        image.centerInSuperview()
        
        // Add a border to the image view
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.black.cgColor

        
        addSubview(title)
        title.makeConstraints(bottomAnchor: bottomAnchor, leadingAnchor: leadingAnchor)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with story: Story){
        self.image.image = story.image
        self.title.text = story.title
    }
    
    
    
}
