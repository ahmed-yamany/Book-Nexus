//
//  ViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit
import SwiftUI

class LoginViewController: LoginSignUpFlowViewController {
    // MARK: - View controller SubViews
    let emailTextField = FormTextField("Email")
    let continueButton = AccentGreenButton("Continue")
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(ColorsManager.accentGreen, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    let spliterView: UIView = {
        let view = UIView()
        let spliterView = UIView()
        view.addSubview(spliterView)

        spliterView.heightConstraints(1)
        spliterView.centerYInSuperviewConstraints()
        spliterView.fillXSuperViewConstraints()
        spliterView.backgroundColor = .darkGray
        
        let bluredView = BluredView()
        view.addSubview(bluredView)
        bluredView.widthConstraints(60)
        bluredView.heightConstraints(20)
        bluredView.centerInSuperviewConstraints()

        let orLabel = UILabel()
        bluredView.addSubview(orLabel)
        orLabel.backgroundColor = ColorsManager.accentBlack
        orLabel.text = "Or"
        orLabel.textColor = .gray
        orLabel.widthConstraints(50)
        orLabel.textAlignment = .center
        orLabel.centerInSuperviewConstraints()
        
        return view
    }()
    let facebookButton = SocialMediaButton("Login with Facebook", with: ImageManager.facebook)
    let googleButton = SocialMediaButton("Login with Google", with: ImageManager.google)
    let appleButton = SocialMediaButton("Login with Apple", with: ImageManager.apple)
    let signupView: UIView = {
        let view = UIView()
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.centerInSuperviewConstraints()
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        let label = UILabel()
        stackView.addArrangedSubview(label)
        label.text = "Don’t have an account?"
        label.textColor = .white
        
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(ColorsManager.accentGreen, for: .normal)
        stackView.addArrangedSubview(button)
//
        return view
    }()

    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Log in"
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(continueButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        stackView.addArrangedSubview(spliterView)
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(appleButton)
        stackView.addArrangedSubview(signupView)

        stackView.updateArrangedSubviewsLayout(ignor: [forgotPasswordButton])
        forgotPasswordButton.heightConstraints(22)

    }

}




//extension
struct LoginView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .ignoresSafeArea()
    }
}
