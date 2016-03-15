//
//  NewFolderViewController.swift
//  KickPaper
//
//  Created by Student on 3/14/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import UIKit

class NewFolderViewController: UIViewController {

    @IBOutlet weak var folderNameTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveFolder(sender: AnyObject) {
        let folderTxt = folderNameTxtField.text
        
        print("Entrou dentro da parada = \(folderNameTxtField.text)")

        if(folderTxt == ""){
            showAlert("Erro", messageTxt: "Nome da matéria está vazio")
        }else{
            if(DirectoryUtilites.createFolder(folderTxt!)){
                print(" folder foi criada")
                self.dismissViewControllerAnimated(true, completion:{})
            }else{
                showAlert("Erro", messageTxt: "Não foi possível criar sua pasta")
            }
        }
    
    }
    
    func showAlert(titleTxt: String, messageTxt: String ){
        let alert = UIAlertController(title: titleTxt, message: messageTxt, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
