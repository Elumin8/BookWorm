//
//  BookStorage.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//
//
//import SwiftUI
//class BookStorage: ObservableObject,Hashable{
//    static func == (lhs: BookStorage, rhs: BookStorage) -> Bool {
//            return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
//        }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(self))
//    }
//
//    @AppStorage("one", store: UserDefaults.standard.set(bookShelf, forKey: "books")) var g = ""
//
//    }
