//
//  CategoriesView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 19/01/2023.
//

import SwiftUI

struct CategoryView: View {
    @State var category: Category = Category(name: "Trending", image: "flame")
    @State var forgroudColor = ColorsManager.textColor
    @State var backgroudColor = ColorsManager.backgroudColor
    @State var isSelected = false {
        didSet{
            if isSelected{
                self.forgroudColor = ColorsManager.backgroudColor
                self.backgroudColor = ColorsManager.accentGreen
            }else{
                self.forgroudColor = ColorsManager.textColor
                self.backgroudColor = ColorsManager.backgroudColor
            }
        }
    }
    
    var body: some View {
        Button {
            self.isSelected.toggle()
            if self.isSelected{
                if let action = category.action{
                    action()
                }
            }
        } label: {
            HStack{
                Image(systemName: category.image)
                Text(category.name)
            }
        }
        .padding(10)
        .background(Color(uiColor: backgroudColor))
        .cornerRadius(35)
        .foregroundColor(Color(uiColor: forgroudColor))
        .overlay(
            RoundedRectangle(cornerRadius: 35)
                .stroke(Color.white, lineWidth: 0.2)
        )
    }
        
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
