//
//  VerticalStackView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 06/01/2023.
//

import UIKit

class VerticalStackView: UIStackView {
    // Initialize the stack view with a vertical axis and 10 spacing between arranged subviews
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 10
    }

    // Implement the required initializer to throw a fatal error
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Add an array of views as arranged subviews to the stack view
    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }

    // Update the layout of the arranged subviews in the stack view
    public func updateArrangedSubviewsLayout(ignoring views: [UIView] = []) {
        arrangedSubviews.forEach { view in
            if !views.contains(view) {
                view.heightConstraints(48)
                view.layer.cornerRadius = 8
            }
        }
    }
}
