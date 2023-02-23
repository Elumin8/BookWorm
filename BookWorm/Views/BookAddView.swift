//
//  BookAddView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI

struct BookAddView: View {
    @Environment(\.dismiss) var dismiss
    @State var bookTitle : String = ""
    @State var authorName : String = ""
    @State var genrePicker: Int = 0
    @State var review: String = ""
    @State var rating: Int = 0
    @State var genres = ["Fantasy","Horror","Mystery","Kids","Poetry","Romance","Thriller"]
    @State var bookShelf: [Book] = []
//    var storage : BookStorage
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    TextField("Name of Book", text: $bookTitle)
                    TextField("Author's name", text: $authorName)
                    Picker(selection: $genrePicker) {
                        ForEach(0 ..< genres.count){
                            Text(self.genres[$0])
                        }
                    } label: {
                        Text("Genre")
                    }
                    .pickerStyle(.navigationLink)
                    Section("write a review"){
                        TextField("", text: $review)
                        Picker(selection: $rating) {
                            ForEach(0 ..< 6){number in
                                Text("\(number)")
                            }
                        } label: {
                            Text("Rating")
                        }.pickerStyle(.navigationLink)
                    }
                    Button("save"){
                        let newBook = createBook()
                        bookShelf.append(newBook)
                        UserDefaults.standard.set(bookShelf, forKey: "bookShelf")
                        dismiss()
                    }
                }
                Spacer()
            }.navigationTitle("ADD your Book")
        }
    }
    func createBook()->Book{
        let newBook = Book(title: self.bookTitle, author: self.authorName, genre: self.genres[genrePicker], review: self.review, rating: self.rating)
        return newBook
    }

}
struct BookAddView_Previews: PreviewProvider {
    static var previews: some View {
        BookAddView()
    }
}
