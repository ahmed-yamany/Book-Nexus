//
//  TopicsCell.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 26/01/2023.
//

import UIKit
import SwiftUI


class TopicsCell: UICollectionViewCell{
    
    func setup(){
        let hostingController = UIHostingController(rootView: TopicsView())
        guard let cell = hostingController.view else { return}
        
        contentView.addSubview(cell)
        cell.fillSuperviewConstraints()
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
