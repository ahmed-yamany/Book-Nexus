//
//  AccentGreenButton.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class AccentGreenButton: UIButton {
    // MARK: - Initialization
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(ColorsManager.accentBlack, for: .normal)
        backgroundColor = ColorsManager.accentGreen
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
