//
//  SecondViewController.swift
//  KickPaper
//
//  Created by Jouderian Ferreira Nobre Junior on 3/11/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var listaDeDisciplinas: UIPickerView!
     var lista: [String] = ["Algebra Linear","Sistemas Distribuidos","Lógica de programação","Teoria de Dados","Swift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listaDeDisciplinas.dataSource=self
        listaDeDisciplinas.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.lista.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.lista[row]
    }
    

    //to save image
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        let pngImageData = UIImagePNGRepresentation(image)
        let result = pngImageData!.writeToFile(path, atomically: true)
        return result
        
    }
    func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        
        let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
        
    }
    
    
    
    @IBAction func registrarConteudo(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // Define the specific path, image name
    //var imagePath = fileInDocumentsDirectory()
}

