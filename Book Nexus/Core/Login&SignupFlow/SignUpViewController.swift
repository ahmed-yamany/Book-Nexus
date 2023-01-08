//
//  SignUpViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 07/01/2023.
//

import UIKit
import SwiftUI

class SignUpViewController: LoginSignUpFlowViewController {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Looks like you don’t have an account. Let’s create a new account for you."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    let nameTextField = FormTextField("Name")
    let emailTextField = FormTextField("Email")
    let passwordTextField = FormTextField("password")

    let createAccountButton = AccentGreenButton("Create Account")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Sign up"
        
        
        let termsAndConditionsView = createNavigationView(labelText: "By selecting Create Account below, I agree to", buttonTitle: "Terms of Service & Privacy Policy", axis: .vertical, action: #selector(self.termsConditionButtonTapped))

        // Create the navigation view
        let haveAccountView = createNavigationView(labelText: "Already have an account?", buttonTitle: "Log in", action: #selector(self.loginButtonTapped))

        
        stackView.addArrangedSubviews([descriptionLabel, nameTextField, emailTextField, passwordTextField, termsAndConditionsView, createAccountButton, haveAccountView])
        stackView.updateArrangedSubviewsLayout()

    }
    
    @objc private func termsConditionButtonTapped(){
        
    }
    @objc private func loginButtonTapped(){
        
    }
    


}


struct SignUpView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return SignUpViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .ignoresSafeArea()
    }
}
