//
//  Disciplina+CoreDataProperties.swift
//  KickPaper
//
//  Created by Student on 3/15/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Disciplina {

    @NSManaged var nome: String?
    @NSManaged var conteudo: NSSet?

}
