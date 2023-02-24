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
    @State private var bookShown = false
    @Environment(\.managedObjectContext) var manObjCont
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

    var body: some View {
        NavigationStack{
            List{
                if books.isEmpty{
                    VStack(alignment: .center){
                        Text("Your bookshelf is empty!")
                            .font(.system(size: 25))
                            .padding()
                        Button{
                            bookAddShow.toggle()
                        }label: {
                            Text("Add new book")
                                .font(.system(size: 20))
                        }.buttonStyle(.borderedProminent)
                    }
                }else{
                    Section("Books"){
                        ForEach(books){book in
                            NavigationLink {
                                DetailView()
                            }label: {
                                HStack{
                                    Text("😍")
                                        .font(.system(size: 40))
                                    Spacer().frame(width: 20)
                                    VStack(alignment: .leading){
                                        Text(book.title ?? "Unknown")
                                            .multilineTextAlignment(.leading)
                                        Text(book.title ?? "Unknown")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                }//:Section
            }
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
    }//:NavStack
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
