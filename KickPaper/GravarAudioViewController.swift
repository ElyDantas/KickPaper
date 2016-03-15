//
//  GravarAudioViewController.swift
//  KickPaper
//
//  Created by Student on 3/14/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import UIKit
import AVFoundation

class GravarAudioViewController: UIViewController,AVAudioRecorderDelegate {

    
    var contador:Int = -1
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:Conteudo!
    
    @IBOutlet weak var nomeGravacaoLabel: UITextField!
    @IBAction func recordButton(sender: UIButton) {
        
        contador++
        if contador%2 == 0 {
            print("Gravando . . .")
            doRecordAction()
            let image = UIImage(named: "mic_red.png") as UIImage!
            sender.setImage(image, forState: .Normal)
        }else{
            print("Finalizado . . .")
            doStopAction()
            let image = UIImage(named: "mic_black.png") as UIImage!
            sender.setImage(image, forState: .Normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func record(){
    
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"

        
        var string = nomeGravacaoLabel.text
        string = string!.stringByReplacingOccurrencesOfString(" ", withString: "")
        let trimmedString = string!.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        let recordingName = trimmedString+"_"+formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath,recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(pathArray)

        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func doRecordAction() {
//        if !audioRecorder.recording {
//            let audioSession = AVAudioSession.sharedInstance()
//            do {
//                try audioSession.setActive(true)
//                audioRecorder.record()
//            } catch {
//            }
//        }
        
        record()
        
    }
    
    func doStopAction() {
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    
    }

    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            let conteudo = Conteudo()
            conteudo.filePathUrl = String(recorder.url)
            conteudo.title = recorder.url.lastPathComponent
            //conteudo.disciplina =
            ConteudoDAO.insert(conteudo)
            
        }
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
