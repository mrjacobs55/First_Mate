//
//  FourthViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 3/14/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

//
//  ThirdViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 2/1/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class EnglishViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate {

    @IBOutlet weak var teacherPicker: UIPickerView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var phoneExtension: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    
    var teachers: [String] = [String]()
    var recipients = "lcalcaterra@socsd.org"
    var phoneURL = NSURL(string: "tel://\(000)")!
    
    override func viewDidLoad() {
        
        self.teacherPicker.delegate = self
        self.teacherPicker.dataSource = self
        
        teachers = ["Ms. Calcaterra", "Ms. Carella", "Ms. Dowling-Murphy", "Ms. Duffy", "Ms. Erickson", "Ms. Stranges", "Ms. Gleeson", "Mr. Matulac", "Ms. Lefkow", "Mr. Stanford"]
        
        let url = NSURL(string: "http://staff.socsdblogs.org/tzhsenglish/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    @IBAction func courses(sender: AnyObject) {
        let url = NSURL(string: "http://staff.socsdblogs.org/tzhsenglish/?page_id=2")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    @IBAction func EHS(sender: AnyObject) {
        let url = NSURL(string: "http://staff.socsdblogs.org/tzhsenglish/?page_id=15")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    //Picker View
    
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
        
        
        if (teacherName.text == "Ms. Calcaterra"){
            self.roomNumber.text = "Rm: "
            email.setTitle("lcalcaterra@socsd.org", forState: .Normal)
            recipients = "lcalcaterra@socsd.org"
            phoneExtension.setTitle("Ext: 7857", forState: .Normal)
        } else if (teacherName.text == "Ms. Carella"){
            self.roomNumber.text = "Rm: "
            email.setTitle("acarella@socsd.org", forState: .Normal)
            recipients = "acarella@socsd.org"
            phoneExtension.setTitle("Ext: 7254", forState: .Normal)
        } else if (teacherName.text == "Ms. Dowling-Murphy"){
            self.roomNumber.text = "Rm: "
            email.setTitle("mdowling@socsd.org", forState: .Normal)
            recipients = "mdowling@socsd.org"
            phoneExtension.setTitle("Ext: 7767", forState: .Normal)
        } else if (teacherName.text == "Ms. Duffy"){
            self.roomNumber.text = "Rm: "
            email.setTitle("fduffy@socsd.org", forState: .Normal)
            recipients = "fduffy@socsd.org"
            phoneExtension.setTitle("Ext: 7739", forState: .Normal)
        } else if (teacherName.text == "Ms. Erickson"){
            self.roomNumber.text = "Rm: "
            email.setTitle("berickson@socsd.org", forState: .Normal)
            recipients = "berickson@socsd.org"
            phoneExtension.setTitle("Ext: 7792", forState: .Normal)
        } else if (teacherName.text == "Ms. Stranges"){
            self.roomNumber.text = "Rm: "
            email.setTitle("dstranges@socsd.org", forState: .Normal)
            recipients = "dstranges@socsd.org"
            phoneExtension.setTitle("Ext: 7830", forState: .Normal)
        } else if (teacherName.text == "Ms. Gleeson"){
            self.roomNumber.text = "Rm: "
            email.setTitle("sgleeson@socsd.org", forState: .Normal)
            recipients = "sgleeson@socsd.org"
            phoneExtension.setTitle("Ext: 7783", forState: .Normal)
        } else if (teacherName.text == "Mr. Matulac"){
            self.roomNumber.text = "Rm:"
            email.setTitle("mmatulac@socsd.org", forState: .Normal)
            recipients = "mmatulac@socsd.org"
            phoneExtension.setTitle("Ext: 7710", forState: .Normal)
        } else if (teacherName.text == "Ms. Lefkow"){
            self.roomNumber.text = "Rm: "
            email.setTitle("lsorreselefkow@socsd.org", forState: .Normal)
            recipients = "lsorreselefkow@socsd.org"
            phoneExtension.setTitle("Ext: 7734", forState: .Normal)
        } else if (teacherName.text == "Mr. Stanford"){
            self.roomNumber.text = "Rm: "
            email.setTitle("mstanford@socsd.org", forState: .Normal)
            recipients = "mstanford@socsd.org"
            phoneExtension.setTitle("Ext: 7772", forState: .Normal)
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

    @IBAction func phone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801600")!
        UIApplication.sharedApplication().openURL(phoneURL)
    }
    
}

