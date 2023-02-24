//
//  DetailView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI

struct DetailView: View {
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    var book = Book()
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack(spacing: 10){
                    ZStack{
                        Image(book.genre ?? "Fantasy")
                        Text(book.genre?.uppercased() ?? "FA")
                            .background(.black)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    Text(book.author ?? "unknown")
                        .font(.system(size: 28))
                        .foregroundColor(.secondary)
                    Text(book.review ?? "unknown")
                }
            }
        }
    }
}
