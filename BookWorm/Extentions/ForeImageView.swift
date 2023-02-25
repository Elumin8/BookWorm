//
//  ForeImageView.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-25.
//

import SwiftUI

struct ForeImageView: View {
    var book : Book
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 3)
                .frame(width: 50)
            Text(book.genre?.uppercased().prefix(1) ?? "U")
            
        }
    }
}
