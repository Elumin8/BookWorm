//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject var coreDataInstance = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataInstance.container.viewContext)  
        }
    }
}
