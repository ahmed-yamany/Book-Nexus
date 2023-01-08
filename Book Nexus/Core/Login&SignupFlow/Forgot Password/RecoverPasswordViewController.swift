//
//  RecoverPasswordViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit
import SwiftUI
class RecoverPasswordViewController: LoginSignUpFlowViewController {
    // MARK: - SubViews
    private let overviewLabel: UILabel = {
        let label = UILabel()
          label.text = "Forgot your password? Don't worry, enter your email to reset your current password."
          label.font = .systemFont(ofSize: 14)
          label.textColor = .white
          label.numberOfLines = 0
          return label
    }()
    private let emailTextField = FormTextField("Email")
    private let sumbiteButton = AccentGreenButton("Submit")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the text of the title label
        titleLabel.text = "Recover Password"
        
        // Create a navigation view using the createNavigationView function
        let signupView = createNavigationView(labelText: "Don't have an account?", buttonTitle: "Sign up", action: #selector(self.signupButtonTapped))

        // Add the views to the stack view and configure the layout
        stackView.addArrangedSubviews([overviewLabel, emailTextField, sumbiteButton, signupView])
        stackView.updateArrangedSubviewsLayout()
        
        
        sumbiteButton.addTarget(self, action: #selector(self.submitButtonTapped), for: .touchUpInside)
    }
    
    @objc func submitButtonTapped(){
        navigationController?.pushViewController(VerifyCodeViewController(), animated: true)
    }
    
    @objc func signupButtonTapped(){
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}


struct RecoverPasswordView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return RecoverPasswordViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct RecoverPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordView()
            .ignoresSafeArea()
    }
}
