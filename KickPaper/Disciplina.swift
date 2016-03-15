//
//  Disciplina.swift
//  KickPaper
//
//  Created by Student on 3/15/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import Foundation
import CoreData


class Disciplina: NSManagedObject {

    
    convenience init(){
        
        let context: NSManagedObjectContext = DatabaseManager.sharedInstance.managedObjectContext
        
        let entityDescription: NSEntityDescription? = NSEntityDescription.entityForName("Disciplina", inManagedObjectContext: context)
        
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        
    }

}
