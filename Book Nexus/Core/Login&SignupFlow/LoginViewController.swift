//
//  ViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit
import SwiftUI

class LoginViewController: LoginSignUpFlowViewController {
    // MARK: - SubViews
    let emailTextField = FormTextField("Email")
    let continueButton = AccentGreenButton("Continue")
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(ColorsManager.accentGreen, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    let splitterView: UIView = {
        let view = UIView()
        let splitterView = UIView()
        view.addSubview(splitterView)

        splitterView.heightConstraints(1)
        splitterView.centerYInSuperviewConstraints()
        splitterView.fillXSuperViewConstraints()
        splitterView.backgroundColor = .darkGray

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

    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log in"
        titleLabel.text = title
        navigationItem.title = ""
        navigationItem.backButtonTitle = "back to Log in"
        navigationController?.navigationBar.tintColor = .white
        
        // Add a target action to the forgot password button
        forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordTapped), for: .touchUpInside)
        forgotPasswordButton.heightConstraints(22)

        // Create the navigation view
        let navigationView = createNavigationView(labelText: "Don't have an account?", buttonTitle: "Sign up")

        // Add the views to the stack view and configure the layout
        stackView.addArrangedSubviews([
                emailTextField, continueButton, forgotPasswordButton, splitterView,
                facebookButton, googleButton, appleButton, navigationView
            ])
        stackView.updateArrangedSubviewsLayout(ignoring: [forgotPasswordButton])
    }
    
    // This method is called when the forgot password button is tapped
    @objc func forgotPasswordTapped(){
        navigationController?.pushViewController(RecoverPasswordViewController(), animated: true)
    }

}

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
