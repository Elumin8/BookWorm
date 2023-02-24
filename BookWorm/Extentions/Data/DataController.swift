//
//  DataController.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "CoreData")
    
    init(){
        container.loadPersistentStores { description, error in
            if let newError = error{
                print("Coredata fetch error:\(error)")
            }
            
        }
    }
}
