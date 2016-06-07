//
//  SceduleViewController.swift
//  TZ First Mate4
//
//  Created by Mitchell Jacobs on 5/6/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import UIKit

class SceduleViewController: UIViewController {

    @IBOutlet weak var lblPeriod9: UILabel!
    @IBOutlet weak var lblPeriod8: UILabel!
    @IBOutlet weak var lblPeriod7: UILabel!
    @IBOutlet weak var lblPeriod6: UILabel!
    @IBOutlet weak var lblPeriod5: UILabel!
    @IBOutlet weak var lblPeriod4: UILabel!
    @IBOutlet weak var lblPeriod3: UILabel!
    @IBOutlet weak var lblPeriod2: UILabel!
    @IBOutlet weak var lblPeriod1: UILabel!
    


    @IBOutlet weak var txtPeriod: UITextField!

    
    var savedBefore: Bool = false
    
    @IBOutlet weak var txtClass: UITextField!
    
    var classes = Scedule()
    
    





    @IBAction func btnSave(sender: AnyObject) {
        var strper:String
        print("VARS DECLARED")
        strper = txtPeriod.text!
        print("VARS INIIT")
        let per = Int(strper)
        if(per != nil){
            classes.sced[per!-1] = txtClass.text!
        }
        update()
        savedBefore=true
        
        self.view.endEditing(true)
        
        txtClass.text = "Enter Class"
        txtPeriod.text = "Enter Period"
        print("SAVED")
    }


     
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hasLaunchedKey = "HasLaunched"
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasLaunched = defaults.boolForKey(hasLaunchedKey)
        print("DECLARED")
        classes.Scedule(hasLaunched) // initialize values if it has not launched before
        print("INITIALIZE")
        //If it is first launch set the stored value to show it has now been launched so data is not cleared
        if !hasLaunched {
            defaults.setBool(true, forKey: hasLaunchedKey)
        }
        print("BEFORE UPDATE")
        print("TEST" + classes.sced[0])
        update() //check linkage of labels
        print("SUCCESS")
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        lblPeriod1.text = classes.sced[0]
        lblPeriod2.text = classes.sced[1]
        lblPeriod3.text = classes.sced[2]
        lblPeriod4.text = classes.sced[3]
        lblPeriod5.text = classes.sced[4]
        lblPeriod6.text = classes.sced[5]
        lblPeriod7.text = classes.sced[6]
        lblPeriod8.text = classes.sced[7]
        lblPeriod9.text = classes.sced[8]
        
        classes.prefs.setValue(classes.sced[0],forKey: classes.getPeriodKey(1))
        classes.prefs.setValue(classes.sced[1],forKey: classes.getPeriodKey(2))
        classes.prefs.setValue(classes.sced[2],forKey: classes.getPeriodKey(3))
        classes.prefs.setValue(classes.sced[3],forKey: classes.getPeriodKey(4))
        classes.prefs.setValue(classes.sced[4],forKey: classes.getPeriodKey(5))
        classes.prefs.setValue(classes.sced[5],forKey: classes.getPeriodKey(6))
        classes.prefs.setValue(classes.sced[6],forKey: classes.getPeriodKey(7))
        classes.prefs.setValue(classes.sced[7],forKey: classes.getPeriodKey(8))
        classes.prefs.setValue(classes.sced[8],forKey: classes.getPeriodKey(9))
        
    }
    
    
}

