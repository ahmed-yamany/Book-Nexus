//
//  BookView.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 21/01/2023.
//

import SwiftUI

struct BookView: View {
    @State var book: Book = Book(image: "book3", name: "Futurama", authorName: "Michael Douglas jr.", minutesToListen: 12, minutesToRead: 9)

    var body: some View {
     
            VStack(alignment: .leading){
                Image(book.image)
                    .renderingMode(.original)
                VStack(alignment: .leading){
                    Text(book.name)
                        .font(.callout)
                    Text(book.authorName)
                        .font(.caption2)
                    HStack {
                        HStack{
                            Image(systemName: "headphones")
                            Text("\(book.minutesToListen.formatted())m")
                        }
                        HStack{
                            Image(systemName: "eyeglasses")
                            Text("\(book.minutesToRead.formatted())m")
                        }
                    }
                    .font(.caption2)
                }
                .foregroundColor(Color(uiColor: ColorsManager.textColor))
            }
            .background(Color(uiColor: ColorsManager.backgroudColor))

        }

            

}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()

    }
}
