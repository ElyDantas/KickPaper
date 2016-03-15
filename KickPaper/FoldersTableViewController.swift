//
//  FoldersTableViewController.swift
//  KickPaper
//
//  Created by Student on 3/14/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import UIKit

class FoldersTableViewController: UITableViewController {
    var folders = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if(!DirectoryUtilites.hasAppFolder()){
            DirectoryUtilites.createBeginFolder()
        }
        
        self.reloadFolders()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func showPromptAlert(sender: AnyObject){
        let alert = UIAlertController(title: "Criar Nova Matéria", message: "Digite o nome da nova matéria", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Nome da matéria"
            textField.secureTextEntry = false
        })
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: {
            (alertAction:UIAlertAction!) in
            alert.dismissViewControllerAnimated(true, completion: {})
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            (alertAction:UIAlertAction!) in
            let textf = alert.textFields![0] as UITextField
            
            if let text = textf.text{
                if text != ""{
                    DirectoryUtilites.createFolder(text)
                    alert.dismissViewControllerAnimated(true, completion: {})
                    self.reloadFolders()
                }
            }
        }))
        
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    func reloadFolders(){
        folders = DirectoryUtilites.fetchAllFolder()
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folders.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foldersTableCell", forIndexPath: indexPath)

        cell.textLabel?.text = folders[indexPath.row]
        
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
