//
//  ViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    // MARK: - View controller subViews
     private let imageView: UIImageView = {
         let image = UIImageView(image: ImageManager.LoginSignUpFlow)
         image.contentMode = .scaleToFill
         return image
    }()
    
    let blueredView: BluredView = BluredView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        
        return stackView
    }()
    
    
    
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.fillSuperviewConstraints()
        
        view.addSubview(blueredView)
        blueredView.updateLayoute()
        
        ///
        
        blueredView.addSubview(stackView)
        stackView.fillSuperviewConstraints(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        
//
        stackView.arrangedSubviews.forEach { view in
            view.heightConstraints(48)
            view.layer.cornerRadius = 8
        }

//        let button = UIButton()
//        button.setTitle("Continue", for: .normal)
//        button.setTitleColor(ColorsManager.accentBlack, for: .normal)
//        button.backgroundColor = ColorsManager.accentGreen
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//
//
//        let button2 = UIButton()
//        button2.setTitle("Ahmed yamany", for: .normal)
//        button2.tintColor = .white
//        button2.backgroundColor = .blue
//
//
//        stackView.addArrangedSubview(button)
//        stackView.addArrangedSubview(button2)
//
        
        
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
