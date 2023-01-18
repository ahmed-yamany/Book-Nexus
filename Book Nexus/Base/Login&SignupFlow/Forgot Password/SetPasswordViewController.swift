//
//  SetPasswordViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 07/01/2023.
//

import UIKit
import SwiftUI

class SetPasswordViewController: LoginSignUpFlowViewController {
    
    let codeVerifiedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle"))
        imageView.equalSizeConstraints(50)
        imageView.tintColor = ColorsManager.accentGreen
        
        let label = UILabel()
        label.text = "Code verified"
        label.textColor = .white
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        return stackView
    }()
    
    let passwordTextField = FormTextField("Enter new password")
    let rePasswordTextField = FormTextField("Re-type new password")
    let passwordDescriptiveLabel: UILabel = {
        let label = UILabel()
        label.text = "At-least 8 characters"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    let setPasswordButton = AccentGreenButton(title: "Set Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Set Password"

        stackView.addArrangedSubviews([codeVerifiedStackView, passwordTextField, rePasswordTextField, passwordDescriptiveLabel, setPasswordButton])
        stackView.updateArrangedSubviewsLayout(ignoring: [codeVerifiedStackView, passwordDescriptiveLabel])
        passwordDescriptiveLabel.heightConstraints(10)
        
    }
    
}

struct SetPasswordView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return SetPasswordViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct SetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView()
            .ignoresSafeArea()
    }
}
