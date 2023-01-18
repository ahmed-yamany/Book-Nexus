//
//  ViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit
import SwiftUI

class LoginEmailViewController: LoginSignUpFlowViewController {
    // MARK: - SubViews
    let emailTextField = FormTextField("Email")
    let continueButton = AccentGreenButton(title: "Continue")
    let splitterView: UIView = {
        let view = UIView()
        let splitterView = UIView()
        view.addSubview(splitterView)

        splitterView.heightConstraints(1)
        splitterView.centerYInSuperview()
        splitterView.fillXSuperViewConstraints()
        splitterView.backgroundColor = .darkGray

        let bluredView = BluredView()
        view.addSubview(bluredView)
        bluredView.widthConstraints(60)
        bluredView.heightConstraints(20)
        bluredView.centerInSuperview()

        let orLabel = UILabel()
        bluredView.addSubview(orLabel)
        orLabel.backgroundColor = ColorsManager.accentBlack
        orLabel.text = "Or"
        orLabel.textColor = .gray
        orLabel.widthConstraints(50)
        orLabel.textAlignment = .center
        orLabel.centerInSuperview()

        return view
        }()
    let facebookButton = SocialMediaButton("Login with Facebook", with: ImageManager.facebook)
    let googleButton = SocialMediaButton("Login with Google", with: ImageManager.google)
    let appleButton = SocialMediaButton("Login with Apple", with: ImageManager.apple)

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        super.titleLabel.text = title
        navigationItem.title = ""
        navigationItem.backButtonTitle = "back to Log in"
        navigationController?.navigationBar.tintColor = .white
        
        // Create and Add a target action to the forgot password button
        let forgotPasswordButton = super.createNavigationButton(with: "Forgot password?")
        forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordTapped), for: .touchUpInside)
        forgotPasswordButton.heightConstraints(22)

        // Create the navigation view
        let signupView = super.createNavigationView(labelText: "Don't have an account?", buttonTitle: "Sign up",
                                                    action: #selector(self.signupButtonTapped))

        // Add the views to the stack view and configure the layout
        super.stackView.addArrangedSubviews([
                emailTextField, continueButton, forgotPasswordButton, splitterView,
                facebookButton, googleButton, appleButton, signupView
            ])
        super.stackView.updateArrangedSubviewsLayout(ignoring: [forgotPasswordButton])
        
        // Add a target action to continue button
        continueButton.addTarget(self, action: #selector(self.continueButtonTapped), for: .touchUpInside)
        
    }
    
    // This method is called when the forgot password button is tapped
    @objc private func forgotPasswordTapped() {
        navigationController?.pushViewController(RecoverPasswordViewController(), animated: true)
    }
    @objc private func continueButtonTapped() {
        navigationController?.pushViewController(LoginPasswordViewController(), animated: true)
    }
    
    @objc private func signupButtonTapped() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
}

struct LoginEmailView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return LoginEmailViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
            .ignoresSafeArea()
    }
}
