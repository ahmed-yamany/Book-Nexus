//
//  LoginSignUpFlowViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class LoginSignUpFlowViewController: UIViewController {
    
    // MARK: - View controller SubViews
    private let imageView: UIImageView = {
        let image = UIImageView(image: ImageManager.LoginSignUpFlow)
        image.contentMode = .scaleToFill
        return image
    }()
    let bluredView: BluredView = BluredView()
    let stackView: VerticalStackView = VerticalStackView()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// ImageView
        view.addSubview(imageView)
        imageView.fillSuperviewConstraints()
        
        /// bluerdView
        view.addSubview(bluredView)
        bluredView.centerXInSuperviewConstraints()
        bluredView.fillXSuperViewConstraints(paddingLeft: 20, paddingRight: 20)
        // make top constraints  1/3 of screen
        bluredView.makeConstraints(top: view.topAnchor, padding: UIEdgeInsets(top: view.frame.height/3, left: 0, bottom: 0, right: 0 ))
        
        /// titleLabel
        view.addSubview(titleLabel)
        titleLabel.makeConstraints(bottom: bluredView.topAnchor, leading: view.leadingAnchor,padding: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 0))

        /// stackView
        self.bluredView.addSubview(stackView)
        stackView.fillSuperviewConstraints(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    


}
