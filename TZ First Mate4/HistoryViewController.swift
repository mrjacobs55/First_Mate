//
//  FifthViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 3/25/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class HistoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate{
    
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
        
        teachers = ["Mr. Borawski", "Ms. Carroll", "Mr. DiDomenico", "Ms. Drivas", "Mr. Ferraro", "Mr. Graney", "Mr. Laskow", "Mr. Muscat", "Mr. Patmos", "Mr. Robertson", "Ms. Rosenthal", "Mr. Sherman", "Mr. Silver", "Ms. Smith"]
        
        let url = NSURL(string: "https://sites.google.com/a/socsd.org/tzhs-social-studies-department/home/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func modelUN(sender: AnyObject) {
        let url = NSURL(string: "https://borawski.weebly.com/mun")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func HHS(sender: AnyObject) {
        let url = NSURL(string: "https://mrrobertson2.wordpress.com/history-honor-society/")
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
    
    if (teacherName.text == "Mr. Borawski"){
        self.roomNumber.text = ""
        email.setTitle("mborawski@socsd.org", forState: .Normal)
        recipients = "mborawski@socsd.org"
        phoneExtension.setTitle("Ext: 7754", forState: .Normal)
    } else if (teacherName.text == "Ms. Carroll") {
        self.roomNumber.text = ""
        email.setTitle("bcarroll@socsd.org", forState: .Normal)
        recipients = "bcarroll@socsd.org"
        phoneExtension.setTitle("", forState: .Normal)
    } else if (teacherName.text == "Mr. DiDomenico") {
        self.roomNumber.text = "Rm: 408"
        email.setTitle("adidomenico@socsd.org", forState: .Normal)
        recipients = "adidomenico@socsd.org"
        phoneExtension.setTitle("", forState: .Normal)
    } else if (teacherName.text == "Ms. Drivas") {
        self.roomNumber.text = "Rm: 306"
        email.setTitle("cdrivas@socsd.org", forState: .Normal)
        recipients = "cdrivas@socsd.org"
        phoneExtension.setTitle("Ext: 1724", forState: .Normal)
    } else if (teacherName.text == "Mr. Ferraro") {
        self.roomNumber.text = ""
        email.setTitle("jferraro@socsd.org", forState: .Normal)
        recipients = "jferraro@socsd.org"
        phoneExtension.setTitle("", forState: .Normal)
    } else if (teacherName.text == "Mr. Graney") {
        self.roomNumber.text = ""
        email.setTitle("lgraney@socsd.org", forState: .Normal)
        recipients = "lgraney@socsd.org"
        phoneExtension.setTitle("", forState: .Normal)
    } else if (teacherName.text == "Mr. Laskow") {
        self.roomNumber.text = "Rm: 423"
        email.setTitle("glaskow@socsd.org", forState: .Normal)
        recipients = "glaskow@socsd.org"
        phoneExtension.setTitle("Ext: 1748", forState: .Normal)
    } else if (teacherName.text == "Mr.Muscat") {
        self.roomNumber.text = "Rm: 412"
        email.setTitle("smuscat@socsd.org", forState: .Normal)
        recipients = "smuscat@socsd.org"
        phoneExtension.setTitle("Ext: 1758", forState: .Normal)
    } else if (teacherName.text == "Mr. Patmos") {
        self.roomNumber.text = ""
        email.setTitle("mpatmos@socsd.org", forState: .Normal)
        recipients = "mpatmos@socsd.org"
        phoneExtension.setTitle("", forState: .Normal)
    } else if (teacherName.text == "Mr. Robertson") {
        self.roomNumber.text = "Rm: 417"
        email.setTitle("mrobertson@socsd.org", forState: .Normal)
        recipients = "mrobertson@socsd.org"
        phoneExtension.setTitle("Ext: 1744", forState: .Normal)
    } else if (teacherName.text == "Ms. Rosenthal") {
        self.roomNumber.text = "Rm: 411"
        email.setTitle("arosenthal@socsd.org", forState: .Normal)
        recipients = "arosenthal@socsd.org"
        phoneExtension.setTitle("Ext: 1759", forState: .Normal)
    } else if (teacherName.text == "Mr. Sherman") {
        self.roomNumber.text = "Rm: 421"
        email.setTitle("ssherman@socsd.org ", forState: .Normal)
        recipients = "ssherman@socsd.org "
        phoneExtension.setTitle("Ext: 1747", forState: .Normal)
    } else if (teacherName.text == "Mr. Silver") {
        self.roomNumber.text = "Rm: 426"
        email.setTitle("ssilver@socsd.org", forState: .Normal)
        recipients = "ssilver@socsd.org"
        phoneExtension.setTitle("Ext: 1749", forState: .Normal)
    } else if (teacherName.text == "Ms. Smith") {
        self.roomNumber.text = "Rm: 422"
        email.setTitle("bsmith@socsd.org", forState: .Normal)
        recipients = "bsmith@socsd.org"
        phoneExtension.setTitle("Ext: 1742", forState: .Normal)
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

