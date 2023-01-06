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

    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Log in"
        
        
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(continueButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        stackView.updateArrangedSubviewsLayout()

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
