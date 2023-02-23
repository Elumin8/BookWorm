//
//  StarView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI
class Star: ObservableObject{
    @Published var rating: Int = 0
}
struct StarView: View {
    @ObservedObject var starRating : Star
    var body: some View {
        HStack{
            Image(systemName: starRating.rating > 0 ? "star.fill" : "star")
            Image(systemName: starRating.rating > 1 ? "star.fill" : "star")
            Image(systemName: starRating.rating > 2 ? "star.fill" : "star")
            Image(systemName: starRating.rating > 3 ? "star.fill" : "star")
            Image(systemName: starRating.rating > 4 ? "star.fill" : "star")
        }
    }
}
