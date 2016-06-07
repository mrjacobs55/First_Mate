//
//  ForeignLanguage.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 4/11/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class ForeignLanguageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var teacherPicker: UIPickerView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var phoneExtension: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    var teachers: [String] = [String]()
    var recipients = "hello@hello.com"
    var phoneURL = NSURL(string: "tel://\(000)")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teacherPicker.delegate = self
        self.teacherPicker.dataSource = self
        
        teachers = ["Ms. Arietta", "Mr. Burgos", "Ms. Castelli", "Ms. Crowe", "Ms. Maloney", "Ms. Moskowitz", "Ms. Root", "Ms. Bruno"]
        
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/foreign-language/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teachers.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teachers[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.teacherName.text = teachers[row]
        
        if (teacherName.text == "Ms. Arietta"){
            self.roomNumber.text = "Rm: C-2"
            email.setTitle("carietta@socsd.org", forState: .Normal)
            recipients = "carietta@socsd.org"
            phoneExtension.setTitle("Ext: 7777", forState: .Normal)
        } else if (teacherName.text == "Mr. Burgos"){
            self.roomNumber.text = "Rm: C-5"
            phoneExtension.setTitle("Ext: 7732", forState: .Normal)
            email.setTitle("pburgos@socsd.org", forState: .Normal)
            recipients = "pburgos@socsd.org"
        } else if (teacherName.text == "Ms. Castelli"){
            self.roomNumber.text = "Rm: C-3"
            email.setTitle("pcastelli@socsd.org", forState: .Normal)
            recipients = "pcastelli@socsd.org"
            phoneExtension.setTitle("Ext: 7786", forState: .Normal)
        } else if (teacherName.text == "Ms. Crowe"){
            self.roomNumber.text = "Rm: 207"
            email.setTitle("ccrowe@socsd.org", forState: .Normal)
            recipients = "ccrowe@socsd.org"
            phoneExtension.setTitle("Ext: 7285", forState: .Normal)
        } else if (teacherName.text == "Ms. Moloney"){
            self.roomNumber.text = "Rm: C-6"
            email.setTitle("emoloney@socsd.org", forState: .Normal)
            recipients = "emoloney@socsd.org"
            phoneExtension.setTitle("Ext: 7757", forState: .Normal)
        } else if (teacherName.text == "Ms. Moskowitz"){
            self.roomNumber.text = "Rm: C-7"
            email.setTitle("smoskowitz@socsd.org", forState: .Normal)
            recipients = "smoskowitz@socsd.org"
            phoneExtension.setTitle("Ext: 7753", forState: .Normal)
        } else if (teacherName.text == "Ms. Root"){
            self.roomNumber.text = "Rm: C-1"
            email.setTitle("mroot@socsd.org", forState: .Normal)
            recipients = "mroot@socsd.org"
            phoneExtension.setTitle("Ext: 7737", forState: .Normal)
        } else if (teacherName.text == "Ms. Stillo"){
            self.roomNumber.text = "Rm: C-4"
            email.setTitle("mstillo@socsd.org", forState: .Normal)
            recipients = "mstillo@socsd.org"
            phoneExtension.setTitle("Ext: 7831", forState: .Normal)
           
        }
    }
    
    //EMAILS
    
    let mailComposerVC = MFMailComposeViewController()
    
    func configureMailComposeViewController() -> MFMailComposeViewController {
        mailComposerVC.mailComposeDelegate = self
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail. Please check e-mail configuration and try again. ", preferredStyle: .Alert)
        
        sendMailErrorAlert.presentViewController(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func email(sender: AnyObject) {
        
        let mailComposeViewController = configureMailComposeViewController()
        
        self.mailComposerVC.setToRecipients([recipients])
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    //PHONE
    
    @IBAction func phone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801600")!
        UIApplication.sharedApplication().openURL(phoneURL)
    }

}

