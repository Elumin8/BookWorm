//
//  ContentView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI


struct ContentView: View {
    @State private var bookAddShow = false
    @State private var bookShown = false
    @Environment(\.managedObjectContext) var manObjCont
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.genre)
    ]) var books: FetchedResults<Book>
    
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
                                DetailView(book: book)
                            }label: {
                                HStack{
                                    ForeImageView(book: book)
                                    Spacer().frame(width: 20)
                                    VStack(alignment: .leading){
                                        Text(book.title ?? "Unknown")
                                            .multilineTextAlignment(.leading)
                                        Text(book.author ?? "Unknown")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
                    
                }//:Section
            }
            .navigationTitle("BookWorm")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        bookAddShow.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $bookAddShow) {
                        BookAddView()
                    }
                }
            }
        }
    }
    func deleteBooks(at shifts: IndexSet) {
        for shift in shifts {
            let book = books[shift]
            manObjCont.delete(book)
            try? manObjCont.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
