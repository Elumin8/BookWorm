//
//  StarView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI
struct StarView: View {
    var book : Book
    var body: some View {
        HStack{
            Image(systemName: book.rating > 0 ? "star.fill" : "star")
            Image(systemName: book.rating > 1 ? "star.fill" : "star")
            Image(systemName: book.rating > 2 ? "star.fill" : "star")
            Image(systemName: book.rating > 3 ? "star.fill" : "star")
            Image(systemName: book.rating > 4 ? "star.fill" : "star")
        }
    }
    
}
