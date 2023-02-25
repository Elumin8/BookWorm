//
//  DetailView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-24.
//

import SwiftUI
struct DetailView: View{
    let book: Book
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var manObjCont
    @State private var deleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Rectangle())
                    .padding(10)
                    .offset(x: -3, y: -3)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
                .font(.system(size: 25))
            Spacer()
            StarView(book: book)
                .foregroundColor(.yellow)
                .font(.system(size: 30))
            Spacer()
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book?", isPresented: $deleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                deleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        manObjCont.delete(book)
        try? manObjCont.save()
        dismiss()
    }
}

