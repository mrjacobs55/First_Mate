//
//  EngineeringViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 4/13/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class EngineeringViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate{
    
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
        
        teachers = ["Mr. Adler", "Mr. Desantis", "Mr. Emmert", "Mr. Keelty"]
        
        let url = NSURL(string: "https://tzhstechnology.wordpress.com")
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
        
        if (teacherName.text == "Mr. Adler"){
            self.roomNumber.text = "Rm: 325"
            email.setTitle("badler@socsd.org", forState: .Normal)
            recipients = "badler@socsd.org"
            phoneExtension.setTitle("Ext: 1739", forState: .Normal)
        } else if (teacherName.text == "Mr. Desantis") {
            self.roomNumber.text = ""
            email.setTitle("bcarroll@socsd.org", forState: .Normal)
            recipients = "bcarroll@socsd.org"
            phoneExtension.setTitle("Ext: 1755", forState: .Normal)
        } else if (teacherName.text == "Mr. Emmert") {
            self.roomNumber.text = "Rm: 408"
            email.setTitle("adidomenico@socsd.org", forState: .Normal)
            recipients = "adidomenico@socsd.org"
            phoneExtension.setTitle("", forState: .Normal)
        } else if (teacherName.text == "Mr. Keelty") {
            self.roomNumber.text = "Rm: 306"
            email.setTitle("cdrivas@socsd.org", forState: .Normal)
            recipients = "cdrivas@socsd.org"
            phoneExtension.setTitle("Ext: 1724", forState: .Normal)
        }
    }
    
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
