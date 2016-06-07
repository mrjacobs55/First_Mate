 //
//  ThirdViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 2/1/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class MathViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate {
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.teacherPicker.delegate = self
        self.teacherPicker.dataSource = self
        
        teachers = ["Ms. Benecke", "Ms. Braunagel", "Mr. Donovan", "Mr. Doremus", "Ms. Jacobs", "Mr. Kavanagh", "Mr. Kousoulas", "Mr. Marino", "Ms. O’Brien", "Ms. Murphy", "Ms. Premus", "Mr. Resnikoff", "Ms. Starink"]
        
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/mathematics/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func muAlphaTheta(sender: AnyObject) {
        let url = NSURL(string: "http://tzmualphatheta.blogspot.com/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func mathTeam(sender: AnyObject) {
        let url = NSURL(string: "http://blogs.socsd.org/tzhs/math-team/")
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
     
        
        if (teacherName.text == "Ms. Benecke"){
            self.roomNumber.text = "Rm: 307"
            email.setTitle("jbenecke@socsd.org", forState: .Normal)
            recipients = "jbenecke@socsd.org"
            phoneExtension.setTitle("Ext: 7705", forState: .Normal)
        } else if (teacherName.text == "Ms. Braunagel"){
            self.roomNumber.text = "Rm: 305"
            phoneExtension.setTitle("Ext: 7702", forState: .Normal)
            email.setTitle("dbraunagel@socsd.org", forState: .Normal)
            recipients = "dbraunagel@socsd.org"
        } else if (teacherName.text == "Mr. Donovan"){
            self.roomNumber.text = "Rm: 200"
            email.setTitle("jdonovan@socsd.org", forState: .Normal)
            recipients = "jdonovan@socsd.org"
            phoneExtension.setTitle("Ext: 7744", forState: .Normal)
        } else if (teacherName.text == "Mr. Doremus"){
            self.roomNumber.text = "Rm: 304"
            email.setTitle("ddoremus@socsd.org", forState: .Normal)
            recipients = "ddoremus@socsd.org"
            phoneExtension.setTitle("Ext: 7858", forState: .Normal)
        } else if (teacherName.text == "Ms. Jacobs"){
            self.roomNumber.text = "Rm: 208"
            email.setTitle("ljacobs@socsd.org", forState: .Normal)
            recipients = "ljacobs@socsd.org"
            phoneExtension.setTitle("Ext: 7745", forState: .Normal)
        } else if (teacherName.text == "Mr. Kavanagh"){
            self.roomNumber.text = "Rm: 303"
            email.setTitle("pkavanagh@socsd.org", forState: .Normal)
            recipients = "pkavanagh@socsd.org"
            phoneExtension.setTitle("Ext: 7751", forState: .Normal)
        } else if (teacherName.text == "Mr. Kousoulas"){
            self.roomNumber.text = "Rm: 310"
            email.setTitle("ekousoulas@socsd.org", forState: .Normal)
            recipients = "ekousoulas@socsd.org"
            phoneExtension.setTitle("Ext: 7744", forState: .Normal)
        } else if (teacherName.text == "Mr. Marino"){
            self.roomNumber.text = "Rm: ???"
            email.setTitle("dmarino@socsd.org", forState: .Normal)
            recipients = "dmarino@socsd.org"
            
            phoneExtension.setTitle("Ext:", forState: .Normal)
            phoneExtension.enabled = false
            
          //  phoneExtension.titleLabel?.textColor = UIColor.grayColor()
            
        } else if (teacherName.text == "Ms. O’Brien"){
            self.roomNumber.text = "Rm: 206"
            email.setTitle("cobrien@socsd.org", forState: .Normal)
            recipients = "cobrien@socsd.org"
            phoneExtension.setTitle("Ext: 7709", forState: .Normal)
        } else if (teacherName.text == "Ms. Murphy"){
            self.roomNumber.text = "Rm: ???"
            email.setTitle("bmurphy@socsd.org", forState: .Normal)
            recipients = "bmurphy@socsd.org"
            phoneExtension.setTitle("Ext: 7765", forState: .Normal)
        } else if (teacherName.text == "Ms. Premus"){
            self.roomNumber.text = "Rm: 315"
            email.setTitle("mpremus@socsd.org", forState: .Normal)
            recipients = "mpremus@socsd.org"
            phoneExtension.setTitle("Ext: 7759", forState: .Normal)
        } else if (teacherName.text == "Mr. Resnikoff"){
            self.roomNumber.text = "Rm: 301"
            email.setTitle("sresnikoff@socsd.org", forState: .Normal)
            recipients = "sresnikoff@socsd.org"
            phoneExtension.setTitle("Ext: 7748", forState: .Normal)
        } else if (teacherName.text == "Ms. Starink"){
            self.roomNumber.text = "Rm: 309"
            email.setTitle("tstarink@socsd.org", forState: .Normal)
            recipients = "tstarink@socsd.org"
            phoneExtension.setTitle("Ext: 7771", forState: .Normal)
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

