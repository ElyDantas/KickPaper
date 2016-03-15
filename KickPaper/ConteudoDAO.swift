//
//  AudioRecordedDAO.swift
//  KickPaper
//
//  Created by Student on 3/15/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import Foundation
import CoreData

class ConteudoDAO{
    
    // TODO:
    
    // insert new object
    static func insert(audio: Conteudo) {
        
        DatabaseManager.sharedInstance.managedObjectContext.insertObject(audio)
        
        do{
            
            try DatabaseManager.sharedInstance.managedObjectContext.save()
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
    }
    
    // update existing object
    static func update() {
        do{
            
            try DatabaseManager.sharedInstance.managedObjectContext.save()
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
    }
    
    // delete object
    static func delete(audio: Conteudo) {
        
        DatabaseManager.sharedInstance.managedObjectContext.deleteObject(audio)
        
        do{
            
            try DatabaseManager.sharedInstance.managedObjectContext.save()
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
    }
    
    // fetch all existing objects
    static func fetchAllConteudos() -> [Conteudo] {
        let request = NSFetchRequest(entityName: "Conteudo")
//        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        var results = [Conteudo]()
        
        do{
            
            results =  try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Conteudo]
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
        return results
        
    }
    
}

