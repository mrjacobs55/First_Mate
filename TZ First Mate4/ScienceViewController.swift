//
//  ScienceViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 4/14/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class ScienceViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate{
    
    @IBOutlet weak var teacherPicker: UIPickerView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var PhoneExtension: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    
    var teachers: [String] = [String]()
    var recipients = "hello@hello.com"
    var phoneURL = NSURL(string: "tel://\(000)")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teacherPicker.delegate = self
        self.teacherPicker.dataSource = self
        
        teachers = ["Mr. Adler", "Mr. Cohn", "Ms. Farish", "Mr. Clinton", "Mr. Dene", "Ms. Distante", "Mr. Francesco", "Mr. Keelty", "Ms. Kilkelly", "Ms. Lai", "Mr. Lorusso", "Mr. Newburger", "Mr. Purkis", "Mr. Rafferty"]
        
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/science-department/")
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
        
        if (teacherName.text == "Mr. Adler"){
            self.roomNumber.text = "Rm: 325"
            email.setTitle("badler@socsd.org", forState: .Normal)
            recipients = "badler@socsd.org"
            PhoneExtension.setTitle("Ext: 1739", forState: .Normal)
        } else if (teacherName.text == "Mr. Cohn") {
            self.roomNumber.text = "Rm: ???"
            email.setTitle("scohn@socsd.org", forState: .Normal)
            recipients = "scohn@socsd.org"
            PhoneExtension.setTitle("Ext: ??", forState: .Normal)
        } else if (teacherName.text == "Ms. Farish") {
            self.roomNumber.text = "Rm: ???"
            email.setTitle("nfarish@socsd.org", forState: .Normal)
            recipients = "nfarish@socsd.org"
            PhoneExtension.setTitle("Ext: ???", forState: .Normal)
        } else if (teacherName.text == "Mr. Clinton") {
            self.roomNumber.text = "Rm: 813"
            email.setTitle("eclinton@socsd.org", forState: .Normal)
            recipients = "eclinton@socsd.org"
            PhoneExtension.setTitle("Ext: 1795", forState: .Normal)
        } else if (teacherName.text == "Mr. Dene") {
            self.roomNumber.text = "Rm: ???"
            email.setTitle("pdene@socsd.org", forState: .Normal)
            recipients = "pdene@socsd.org"
            PhoneExtension.setTitle("Ext: ????", forState: .Normal)
        } else if (teacherName.text == "Ms. Distante") {
            self.roomNumber.text = "Rm: 316"
            email.setTitle("kdistante@socsd.org", forState: .Normal)
            recipients = "kdistante@socsd.org"
            PhoneExtension.setTitle("Ext: 1734", forState: .Normal)
        } else if (teacherName.text == "Mr. Francesco") {
            self.roomNumber.text = "Rm: 324"
            email.setTitle("mfrancesco@socsd.org ", forState: .Normal)
            recipients = "mfrancesco@socsd.org "
            PhoneExtension.setTitle("Ext: 1740", forState: .Normal)
        } else if (teacherName.text == "Mr. Keelty") {
            self.roomNumber.text = "Rm: 423"
            email.setTitle("jkeelty@socsd.org", forState: .Normal)
            recipients = "jkeelty@socsd.org"
            PhoneExtension.setTitle("Ext: 1737", forState: .Normal)
        } else if (teacherName.text == "Ms. Kilkelly") {
            self.roomNumber.text = "Rm: 801"
            email.setTitle("pkilkelly@socsd.org", forState: .Normal)
            recipients = "pkilkelly@socsd.org"
            PhoneExtension.setTitle("Ext: 1791", forState: .Normal)
        } else if (teacherName.text == "Ms. Lai") {
            self.roomNumber.text = "Rm: "
            email.setTitle("nlai@socsd.org", forState: .Normal)
            recipients = "nlai@socsd.org"
            PhoneExtension.setTitle("Ext: 1791", forState: .Normal)
        } else if (teacherName.text == "Mr. Lorusso") {
            self.roomNumber.text = "Rm: ???"
            email.setTitle("clorusso@socsd.org", forState: .Normal)
            recipients = "clorusso@socsd.org"
            PhoneExtension.setTitle("Ext: ???", forState: .Normal)
        } else if (teacherName.text == "Mr. Newburger") {
            self.roomNumber.text = "Rm: C - 8"
            email.setTitle("bnewburger@socsd.org", forState: .Normal)
            recipients = "bnewburger@socsd.org"
            PhoneExtension.setTitle("Ext: 1824", forState: .Normal)
        } else if (teacherName.text == "Mr. Purkis") {
            self.roomNumber.text = "Rm: 800"
            email.setTitle("spurkis@socsd.org", forState: .Normal)
            recipients = "spurkis@socsd.org"
            PhoneExtension.setTitle("Ext: 1790", forState: .Normal)
        } else if (teacherName.text == "Mr. Rafferty") {
            self.roomNumber.text = "Rm: 807"
            email.setTitle("drafferty@socsd.org", forState: .Normal)
            recipients = "drafferty@socsd.org"
            PhoneExtension.setTitle("Ext: 1793", forState: .Normal)
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
