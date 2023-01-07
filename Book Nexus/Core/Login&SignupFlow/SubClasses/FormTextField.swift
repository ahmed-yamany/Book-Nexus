//
//  FormTextField.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class FormTextField: UITextField{
    init(_ placeholder: String){
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.setLeftPaddingPoints(20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
