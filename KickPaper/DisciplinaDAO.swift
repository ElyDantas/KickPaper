
import Foundation
import CoreData

class DisciplinaDAO{
    
    // TODO:
    
    // insert new object
    static func insert(audio: Disciplina) {
        
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
    static func delete(audio: Disciplina) {
        
        DatabaseManager.sharedInstance.managedObjectContext.deleteObject(audio)
        
        do{
            
            try DatabaseManager.sharedInstance.managedObjectContext.save()
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
    }
    
    // fetch all existing objects
    static func fetchAllDisciplinas() -> [Disciplina] {
        let request = NSFetchRequest(entityName: "Disciplina")
        
        var results = [Disciplina]()
        
        do{
            
            results =  try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Disciplina]
            
        }catch let erro as NSError {
            print("Error ao inserir",erro)
        }
        
        return results
        
    }
    
}

