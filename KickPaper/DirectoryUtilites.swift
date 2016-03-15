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
    
    static func fetchAllFolder() -> [NSString]{
        do{
            return try DirectoryUtilites.fileManager.contentsOfDirectoryAtPath(documentsPath.path!) as [NSString]
        }catch let error as NSError{
            print(error.description)
        }
        
        return []
    }
    
    
}