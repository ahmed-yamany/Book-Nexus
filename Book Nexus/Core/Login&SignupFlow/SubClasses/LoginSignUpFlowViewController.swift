//
//  LoginSignUpFlowViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class LoginSignUpFlowViewController: UIViewController {
    
    // MARK: - SubViews
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
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add and Constrain the image view to fill the superview
        view.addSubview(imageView)
        imageView.fillSuperviewConstraints()
        
        // Add and Constrain the blured view to be centered horizontally and filled in x with 20 padding in the superview
        view.addSubview(bluredView)
        bluredView.centerXInSuperviewConstraints()
        bluredView.fillXSuperViewConstraints(paddingLeft: 20, paddingRight: 20)
        
        // Constrain the top of the blured view to be 1/3 of the height of the superview from the top of the superview
        bluredView.makeConstraints(topAnchor: view.topAnchor, padding: UIEdgeInsets(top: view.frame.height/3, left: 0, bottom: 0, right: 0 ))
        
        // Add and Constrain the title label to be 20 points from the bottom of the blured view and 20 points from the leading edge of the superview
        view.addSubview(titleLabel)
        titleLabel.makeConstraints(bottomAnchor: bluredView.topAnchor, leadingAnchor: view.leadingAnchor,padding: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 0))

        // Add and Constrain stackview to be filled in the bluredView with padding of 20 from each side
        self.bluredView.addSubview(stackView)
        stackView.fillSuperviewConstraints(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    
    // Define a function that creates and returns a navigation view
    func createNavigationView(labelText: String, buttonTitle: String) -> UIView {
        // Create the view
        let view = UIView()

        // Create the stack view and add it as a subview to the view
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        view.addSubview(stackView)

        // Create the label and add it as an arranged subview to the stack view
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        stackView.addArrangedSubview(label)

        // Create the button and add it as an arranged subview to the stack view
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(ColorsManager.accentGreen, for: .normal)
        stackView.addArrangedSubview(button)

        // Center the stack view in the view using constraints
        stackView.centerInSuperviewConstraints()

        // Return the view
        return view
    }
}
