//
//  SecondViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 2/29/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import MessageUI

class FacultyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    //PHONE
    
    var phoneURL = NSURL(string: "tel://000")!
    
    @IBAction func amosPhone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801606")!
        UIApplication.sharedApplication().openURL(phoneURL)
    }
    
    @IBAction func gevargisPhone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801650")!
        UIApplication.sharedApplication().openURL(phoneURL)
    }

    @IBAction func neidhartPhone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801655")!
        UIApplication.sharedApplication().openURL(phoneURL)
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
    
    @IBAction func amosEmail(sender: AnyObject) {
        
        let mailComposeViewController = configureMailComposeViewController()
        
        self.mailComposerVC.setToRecipients(["jamos@socsd.org"])
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    @IBAction func gervargisEmail(sender: AnyObject) {
        let mailComposeViewController = configureMailComposeViewController()
        
        self.mailComposerVC.setToRecipients(["jgervargis@socsd.org"])
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }

    }
    
    @IBAction func neidhartEmail(sender: AnyObject) {
        let mailComposeViewController = configureMailComposeViewController()
        
        self.mailComposerVC.setToRecipients(["rneidhart@socsd.org"])
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }

    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

