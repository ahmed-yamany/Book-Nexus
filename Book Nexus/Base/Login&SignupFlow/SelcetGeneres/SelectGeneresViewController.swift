//
//  SelectGeneresViewController.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 08/01/2023.
//

import UIKit
import SwiftUI

class SelectGenryCategoriesViewController: LoginSignUpFlowViewController {
    // MARK: - Properties
    let categories: [String] = ["Swift", "iOS", "Objective-C", "Xcode", "macOS", "iPad", "iPhone", "watchOS", "tvOS", "UIKit"]
    var selectedCategories: [String] = []

    // MARK: - Subview
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Select the type of book you enjoy reading."
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    let continueButton = AccentGreenButton(title: "Continue")
    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(GeneryCell.self, forCellWithReuseIdentifier: GeneryCell.identifier)
        
        return collectionView
    }()
    let selectionDescriptiveLabel: UILabel = {
        let label = UILabel()
        label.text = "Select 3 or more genres to continue"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        super.imageView.image = nil
        view.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        super.titleLabel.text = "Select Genres"
        
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
        
//        bluredView.makeConstraints(topAnchor: view.topAnchor, padding: UIEdgeInsets(top: view.frame.height/6, left: 0, bottom: 0, right: 0 ))
        
        // Create and Add a target action to the forgot password button
        let showMoreButton = super.createNavigationButton(with: "Show More")
        showMoreButton.addTarget(self, action: #selector(self.showMoreButtonTapped), for: .touchUpInside)
        showMoreButton.heightConstraints(22)
                
        super.stackView.addArrangedSubviews([descriptionLabel,
                                             categoriesCollectionView,
                                             showMoreButton, continueButton, selectionDescriptiveLabel])
        super.stackView.updateArrangedSubviewsLayout(ignoring: [categoriesCollectionView, showMoreButton,
                                                                selectionDescriptiveLabel])
        categoriesCollectionView.heightConstraints(300)
        selectionDescriptiveLabel.heightConstraints(15)
        
    }
    
    @objc private func showMoreButtonTapped() {
        
    }
        
}

extension SelectGenryCategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneryCell.identifier, for: indexPath) as? GeneryCell else {
            return UICollectionViewCell()
            
        }
        let tag = categories[indexPath.row]
        cell.nameLabel.text = tag
        cell.backgroundColor = .green
    
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // calculate the size of the tag based on the text and font
          let tagText = categories[indexPath.item]
          let font = UIFont.systemFont(ofSize: 30)
          let width = tagText.size(withAttributes: [NSAttributedString.Key.font: font]).width // add padding
        
          return CGSize(width: width, height: 30)
//        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}

struct MovieCategoriesView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return UINavigationController(rootViewController: SelectGenryCategoriesViewController())
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct MovieCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoriesView()
            .ignoresSafeArea()
    }
}
