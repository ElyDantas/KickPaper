//
//  DirectoryUtilites.swift
//  KickPaper
//
//  Created by Student on 3/10/16.
//  Copyright © 2016 HackATruck. All rights reserved.
//

import Foundation
import UIKit


class DirectoryUtilites {
    static let fileManager = NSFileManager.defaultManager()
    
    static let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0])
    
    static let kickPaper = DirectoryUtilites.documentsPath.URLByAppendingPathComponent("KickPaper")

    static let teste = DirectoryUtilites.kickPaper.URLByAppendingPathComponent("Teste")

    
    static func hasAppFolder() -> Bool{
        if DirectoryUtilites.fileManager.fileExistsAtPath(DirectoryUtilites.kickPaper.path!){
        
            return true
        }
        
        return false
    }
    
    static func createBeginFolder(){
        do{
            try fileManager.createDirectoryAtPath(DirectoryUtilites.kickPaper.path!, withIntermediateDirectories: false, attributes:nil)
        }catch let error as NSError{
            print(error.description)
        }
    }

    static func createFolderMassa(){
        do{
            try fileManager.createDirectoryAtPath(DirectoryUtilites.teste.path!, withIntermediateDirectories: false, attributes:nil)
        }catch let error as NSError{
            print(error.description)
        }
    }

    static func createFolder(folderName: String) -> Bool{
        let newFolder = DirectoryUtilites.kickPaper.URLByAppendingPathComponent(folderName)

        do{
            try fileManager.createDirectoryAtPath(newFolder.path!, withIntermediateDirectories: false, attributes:nil)
            return true
        }catch let error as NSError{
            print(error.description)
            return false
        }
    }
    
    static func fetchAllFolder() -> [String]{
        do{
            return try DirectoryUtilites.fileManager.contentsOfDirectoryAtPath(kickPaper.path!) as [String]
        }catch let error as NSError{
            print(error.description)
        }
        
        return []
    }
    
    
}