//
//  CategoriesSwiftUIView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import SwiftUI

struct CategoriesView: View {
    @State var categories: [Category] = [
        Category(name: "Trending", image: "flame"),
        Category(name: "5-Minutes Read", image: "book"),
        Category(name: "Quick Listen", image: "headphones"),
        Category(name: "5-Minutes Read", image: "house"),
        Category(name: "Trending", image: "flame"),
        Category(name: "5-Minutes Read", image: "house"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 5){
                ForEach(categories, id: \.id) { category in
                    CategoryView(category: category)
                }
            }
            .padding(10)

        }

    }
}

struct CategoriesSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
