//
//  LoginPasswordViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 07/01/2023.
//

import UIKit
import SwiftUI
class LoginPasswordViewController: LoginSignUpFlowViewController {
    // MARK: - subviews
    let userDetailView = UserDetailView(image: UIImage(named: "profile"), name: "John Doe", email: "john.doe@example.com")
    let passwordTextField = FormTextField("Password")
    let continueButton = AccentGreenButton("Continue")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "Log in"
        // Create and Add a target action to the forgot password button
        let forgotPasswordButton = createNavigationButton(with: "Forgot password?")
        forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordTapped), for: .touchUpInside)
        forgotPasswordButton.heightConstraints(22)

        // Add the views to the stack view and configure the layout
        stackView.addArrangedSubviews([userDetailView, passwordTextField, continueButton, forgotPasswordButton])
        stackView.updateArrangedSubviewsLayout(ignoring: [userDetailView, forgotPasswordButton])
        userDetailView.heightConstraints(80)
        
    }
    
    // This method is called when the forgot password button is tapped
    @objc func forgotPasswordTapped(){
        navigationController?.pushViewController(RecoverPasswordViewController(), animated: true)
    }
    
    
}


struct LoginPasswordView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return LoginPasswordViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct LoginPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPasswordView()
            .ignoresSafeArea()
    }
}
