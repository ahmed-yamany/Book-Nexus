//
//  Category.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import UIKit

struct Category: Identifiable{
    var id = UUID()
    let name: String
    let image: String
    var action: (() -> Void)?
}
