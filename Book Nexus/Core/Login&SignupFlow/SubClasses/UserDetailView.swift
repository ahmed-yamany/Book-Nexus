//
//  UserDetailView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 07/01/2023.
//

import UIKit


class UserDetailView: UIView {
    // MARK: - Properties
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.equalSizeConstraints(60)
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()

    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    // Stack view to stack the name and email labels vertically
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    // Image view to display the circled checkmark image
    let checkmarkImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle"))
        imageView.tintColor = ColorsManager.accentGreen
        return imageView
    }()
    
    // MARK: - Initialization
    init(image: UIImage?, name: String, email: String) {
        super.init(frame: .zero)
        // Set the values of the image view, name label, and email label
        self.imageView.image = image
        self.nameLabel.text = name
        self.emailLabel.text = email
        
        // Add the image view, stack view, and checked image to the view hierarchy
        addSubview(imageView)
        addSubview(verticalStackView)
        addSubview(checkmarkImage)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(emailLabel)
                
        // Center the image view vertically in the superview
        imageView.centerYInSuperviewConstraints()
        
        // Center the stack view vertically in the superview
        verticalStackView.centerYInSuperviewConstraints()
        // Set the stack view's leading anchor to the image view's trailing anchor and add a 16 point padding
        verticalStackView.makeConstraints(leadingAnchor: imageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
        
        // Center the checked image vertically in the superview
        checkmarkImage.centerYInSuperviewConstraints()
        
        // Set the checked image's leading anchor to the superview's trailing anchor and add a -16 point padding
        checkmarkImage.makeConstraints(leadingAnchor: trailingAnchor, padding: UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0))

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

