//
//  BookAddView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI

struct BookAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var manObjCont
    @State var bookTitle : String = ""
    @State var authorName : String = ""
    @State var genre: String = "Fantasy"
    @State var review: String = ""
    @State var rating: Int = 0
    @State var genres = ["Fantasy","Horror","Mystery","Kids","Poetry","Romance","Thriller"]
    @State var additionalButton = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    TextField("Name of Book", text: $bookTitle)
                    TextField("Author's name", text: $authorName)
                    Picker(selection: $genre) {
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    } label: {
                        Text("Genre")
                    }
                    .pickerStyle(.navigationLink)
                    Section("write a review"){
                        TextEditor(text: $review)
                        Picker(selection: $rating) {
                            ForEach(0 ..< 6){number in
                                Text("\(number)")
                            }
                        } label: {
                            Text("Rating")
                        }.pickerStyle(.navigationLink)
                    }
                    Button("save"){
                        //creating book
                        if bookTitle != "" && authorName != ""{
                            let newBook = Book(context: manObjCont)
                            newBook.id = UUID()
                            newBook.title = bookTitle
                            newBook.author = authorName
                            newBook.genre = genre
                            newBook.rating = Int32(rating)
                            newBook.review = review
                            try? manObjCont.save()
                            dismiss()
                        }else{
                            additionalButton = true
                        }
                    }
                }
                
                Text("Write book's name and book's author please!")
                    .opacity(additionalButton ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: additionalButton)
                Spacer()
            }.navigationTitle("ADD your Book")
        }
    }
    
}

struct BookAddView_Previews: PreviewProvider {
    static var previews: some View {
        BookAddView()
    }
}
