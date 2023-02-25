//
//  DataController.swift
//  BookWorm
//
//  Created by Kyrylo Kolosov on 2023-02-23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "BookWorm")
    
    init(){
        container.loadPersistentStores { description, error in
            if error != nil{
                print("Coredata fetch error:\(error?.localizedDescription)")
            }
            
        }
    }
}
