//
//  FirstViewController.swift
//  TZ First Mate4
//
//  Created by Michael Morales on 2/29/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class HomeViewController: UIViewController {

    @IBOutlet weak var lblCurrent: UILabel!
    var phoneURL:NSURL = NSURL(string: "tel://000)")!
    
    @IBAction func mainOfficePhone(sender: AnyObject) {
        phoneURL = NSURL(string: "tel://8456801600")!
        UIApplication.sharedApplication().openURL(phoneURL)
    }
    
    //TODO: Link picture to TZHS webpage 
    
    //TODO: Link address to map
    
    let periodCalc: CalcPeriod = CalcPeriod()
    let stored : Scedule = Scedule()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stored.Scedule(true)
        prntClass()
        _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(self.prntClass), userInfo: nil, repeats: true)  // UPDATES EVERY 180 SEOCNDS(3 MINS) //there used to be a "#" before selector(s)
        print("TEST")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prntClass(){
        let periods : [String] = ["Too Early","1st Period","2nd Period","3rd Period","4th Period","5th Period","6th Period","7th Period","8th Period","9th Period","Schools Out!!!!!", "It's the Weekend"]
        let period = periodCalc.getPeriod(false)
        
        if(period == 0 || period == 10 || period == 11){// if its early late or weekend no need to print class
            lblCurrent.text = periods[period]
        }else{
            //TODO add current class
            // ^ Done see below, had to run initialization of stored before accessing sced
            lblCurrent.text = periods[period] + "\n" + stored.sced[period - 1]
        }
        
    }


}

