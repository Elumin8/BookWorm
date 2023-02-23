//
//  ContentView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var starRating = Star()
    @State private var bookAddShow = false
//    @StateObject var bookStorage = BookStorage()
    
    var genres = ["Fantasy","Horror","Mystery","Kids","Poetry","Romance","Thriller"]
    
    var body: some View {
        NavigationStack{
                List{
//                    if bookStorage.bookShelf.isEmpty{
//                        VStack(alignment: .center){
//                            Text("Your bookshelf is empty!")
//                                .font(.system(size: 25))
//                                .padding()
//                            Button{
//                                bookAddShow.toggle()
//                            }label: {
//                                Text("Add new book")
//                                    .font(.system(size: 20))
//                            }.buttonStyle(.borderedProminent)
//                        }
//                    }else{
                        Section("Books"){
                            
                            ForEach(newBookShelf){book in
                                NavigationLink(value: book) {
                                    HStack{
                                        Text("😍")
                                            .font(.system(size: 40))
                                        Spacer().frame(width: 20)
                                        VStack(alignment: .leading){
                                            Text(book.title)
                                                .multilineTextAlignment(.leading)
                                            Text(book.title)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            }
                        }//:Section
//                    }
                }//:List
            .navigationTitle("BookWorm")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                Button {
                    bookAddShow.toggle()
                } label: {
                    Image(systemName: "plus")
                }.sheet(isPresented: $bookAddShow) {
                    BookAddView()
                    }

            })
            .navigationDestination(for:Book.self) { book in
                    ZStack{
                        VStack(spacing: 10){
                            Image(book.genre)
                            
                                .overlay {
                                    Text(book.genre)
                                        .background(.black)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            Text(book.author)
                                .font(.system(size: 28))
                                .foregroundColor(.secondary)
                            
                            Text(book.review)
                            Spacer()
                            StarView(starRating: starRating)
                            Spacer()
                            
                            
                        }
                        .border(.black)
                    }.navigationTitle(book.title)
                        .navigationBarTitleDisplayMode(.inline)
                        
            }
            Button("Hello"){
                
            }
        }//:NavStack
//        .environmentObject(bookStorage)
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
