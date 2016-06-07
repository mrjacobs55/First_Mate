//
//  TheArtsViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 4/16/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class TheArtsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate {
    
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
        
        teachers = ["Ms. Biggs", "Ms. Grasso", "Mr. Hughes", "Mr. Ko", "Ms. B. Labrake", "Ms. L. Labrake", "Mr. Rossi", "Mr. Wagoner"]
        
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/fine-art-department/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
    }
    
    @IBAction func art(sender: AnyObject) {
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/fine-art-department/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func music(sender: AnyObject) {
        let url = NSURL(string: "http://blogs.socsd.org/music/tzhs/")
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
        
        if (teacherName.text == "Ms. Biggs"){
            self.roomNumber.text = "Rm: ???"
            email.setTitle("abiggs@socsd.org", forState: .Normal)
            recipients = "abiggs@socsd.org"
            phoneExtension.setTitle("Ext: 1224", forState: .Normal)
        } else if (teacherName.text == "Ms. Grasso") {
            self.roomNumber.text = "Rm: 707"
            email.setTitle("dgrasso@socsd.org", forState: .Normal)
            recipients = "dgrasso@socsd.org"
            phoneExtension.setTitle("Ext: 7731", forState: .Normal)
        } else if (teacherName.text == "Mr. Hughes") {
            self.roomNumber.text = "Rm: 951"
            email.setTitle("whughes@socsd.org", forState: .Normal)
            recipients = "whughes@socsd.org"
            phoneExtension.setTitle("Ext: 1870", forState: .Normal)
        } else if (teacherName.text == "Mr. Ko") {
            self.roomNumber.text = "Rm: 306"
            email.setTitle("ybko@socsd.org", forState: .Normal)
            recipients = "ybko@socsd.org"
            phoneExtension.setTitle("Ext: 7743", forState: .Normal)
        } else if (teacherName.text == "Ms. B. Labrake") {
            self.roomNumber.text = "Rm: 713"
            email.setTitle("blabrake@socsd.org", forState: .Normal)
            recipients = "blabrake@socsd.org"
            phoneExtension.setTitle("Ext: 7766", forState: .Normal)
        } else if (teacherName.text == "Ms. L. Labrake") {
            self.roomNumber.text = "Rm: ???"
            email.setTitle("llabrake@socsd.org", forState: .Normal)
            recipients = "llabrake@socsd.org"
            phoneExtension.setTitle("Ext: 7764", forState: .Normal)
        } else if (teacherName.text == "Mr. Rossi") {
            self.roomNumber.text = "Rm: 956"
            email.setTitle("jrossi@socsd.org", forState: .Normal)
            recipients = "jrossi@socsd.org"
            phoneExtension.setTitle("Ext: 1799", forState: .Normal)
        } else if (teacherName.text == "Mr. Wagoner") {
            self.roomNumber.text = "Rm: 954"
            email.setTitle("rwagoner@socsd.org", forState: .Normal)
            recipients = "rwagoner@socsd.org"
            phoneExtension.setTitle("Ext: 1798", forState: .Normal)
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