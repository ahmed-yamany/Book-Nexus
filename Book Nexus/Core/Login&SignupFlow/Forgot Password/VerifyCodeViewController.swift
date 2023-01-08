//
//  VerifyCodeViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 07/01/2023.
//

import UIKit
import SwiftUI

class VerifyCodeViewController: LoginSignUpFlowViewController {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "An authentication code has been sent to your email."
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    let codeTextField = FormTextField("Enter Code")
    let verifyButton = AccentGreenButton("Verify")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "Verify Code"
        
        let resendView = createNavigationView(labelText: "Don’t receive a code?", buttonTitle: "Resend", action: #selector(self.resendButtonPressed))

        stackView.addArrangedSubviews([descriptionLabel, codeTextField, verifyButton, resendView])
        stackView.updateArrangedSubviewsLayout()
        
        
        verifyButton.addTarget(self, action: #selector(self.verifyButtonPressed), for: .touchUpInside)
    }
    
    @objc func verifyButtonPressed(){
        navigationController?.pushViewController(SetPasswordViewController(), animated: true)
    }
    
    @objc func resendButtonPressed(){
        navigationController?.pushViewController(SetPasswordViewController(), animated: true)
    }
    
}

struct VerifyCodeView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return VerifyCodeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView()
            .ignoresSafeArea()
    }
}
