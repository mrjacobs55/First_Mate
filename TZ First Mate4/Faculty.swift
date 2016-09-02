//
//  File.swift
//  TZ First Mate4
//
//  Created by Mitchell Jacobs on 8/29/16.
//  Copyright © 2016 Michael Morales. All rights reserved.
//

import Foundation

import UIKit
import MessageUI
class Faculty : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIWebViewDelegate{
    
    @IBOutlet weak var pickSub: UIPickerView!
    @IBOutlet weak var pickTeach: UIPickerView!
    
    private var selectedTeach: String = ""
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var email: UIButton!
    private var recipients : String = ""
    
    private var subjects : [String] = ["Math","Science","History","Arts","Computer Science","Engineering","Foreign Language", "English"]
    private var teachers : [[String]] = [[]]
    private var selectedSub : Int = 0
    
    @IBOutlet weak var website: UIButton!
    private var url : NSURL = NSURL(string: "https://www.google.com")!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        pickSub.delegate = self
        pickSub.dataSource = self
        pickTeach.delegate = self
        pickTeach.dataSource = self
        
        let mathTeach = ["Ms. Benecke", "Ms. Braunagel", "Mr. Donovan", "Mr. Doremus", "Ms. Jacobs", "Mr. Kavanagh", "Mr. Kousoulas", "Mr. Marino", "Ms. O’Brien", "Ms. Murphy", "Ms. Premus", "Mr. Resnikoff", "Ms. Starink" , ""] //13
        let scienceTeach = ["Mr. Adler", "Mr. Cohn", "Ms. Farish", "Mr. Clinton", "Mr. Dene", "Ms. Distante", "Mr. Francesco", "Mr. Keelty", "Ms. Kilkelly", "Ms. Lai", "Mr. Lorusso", "Mr. Newburger", "Mr. Purkis", "Mr. Rafferty"] //14
        let historyTeach = ["Mr. Borawski", "Ms. Carroll", "Mr. DiDomenico", "Ms. Drivas", "Mr. Ferraro", "Mr. Graney", "Mr. Laskow", "Mr. Muscat", "Mr. Patmos", "Mr. Robertson", "Ms. Rosenthal", "Mr. Sherman", "Mr. Silver", "Ms. Smith"] //14
        let artsTeach = ["Ms. Biggs", "Ms. Grasso", "Mr. Hughes", "Mr. Ko", "Ms. B. Labrake", "Ms. L. Labrake", "Mr. Rossi", "Mr. Wagoner", "", "", "", "", "" , ""] //8
        let compSciTeach = ["Ms. Connell" , "Us Awesome People", "","","","","","","","","","","",""]//2
        let engineeringTeach = ["Mr. Adler", "Mr. Desantis", "Mr. Emmert", "Mr. Keelty","","","","","","","","","",""] //4
        let foreignLangTeach = ["Ms. Arietta", "Mr. Burgos", "Ms. Castelli", "Ms. Crowe", "Ms. Moloney", "Ms. Moskowitz", "Ms. Root", "Ms. Bruno","","","","","",""] //8
        let englishTeach = ["Ms. Calcaterra", "Ms. Carella", "Ms. Dowling-Murphy", "Ms. Duffy", "Ms. Erickson", "Ms. Stranges", "Ms. Gleeson", "Mr. Matulac", "Ms. Lefkow", "Mr. Stanford","","","",""] //10
        
        print(mathTeach.count)
        print(scienceTeach.count)
        print(historyTeach.count)
        print(artsTeach.count)
        print(compSciTeach.count)
        print(engineeringTeach.count)
        print(foreignLangTeach.count)
        print(englishTeach.count)
        
        teachers = [mathTeach,scienceTeach,historyTeach,artsTeach,compSciTeach,engineeringTeach,foreignLangTeach,englishTeach]
        
        teacherName.text = teachers[0][0]
        self.roomNumber.text = "Room: 307"
        email.setTitle("jbenecke@socsd.org", forState: .Normal)
        recipients = "jbenecke@socsd.org"
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == pickSub){
            return subjects.count
        }
        else{
            return teachers.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == pickSub){
            return subjects[row]
        }
        
        return teachers[pickSub.selectedRowInComponent(0)][row];
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if(pickerView == pickSub){
            let attributedString = NSAttributedString(string: subjects[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            return attributedString
        }
        let attributedString = NSAttributedString(string: teachers[pickSub.selectedRowInComponent(0)][row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        return attributedString

        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if(pickerView == pickSub){
            self.selectedSub = row
            pickTeach.reloadAllComponents()
            return
        }
        selectedTeach = teachers[pickSub.selectedRowInComponent(0)][pickTeach.selectedRowInComponent(0)]
        
        print(selectedTeach)
        
        teacherName.text = selectedTeach
        
        if (selectedTeach == "Ms. Arietta"){
            self.roomNumber.text = "Room: C-2"
            email.setTitle("carietta@socsd.org", forState: .Normal)
            recipients = "carietta@socsd.org"
            url = NSURL(string: "http://blogs.socsd.org/carietta")!
            website.setTitle(String(url), forState: .Normal)
            return
            
        } else if (selectedTeach == "Mr. Burgos"){
            self.roomNumber.text = "Room: C-5"
            
            email.setTitle("pburgos@socsd.org", forState: .Normal)
            recipients = "pburgos@socsd.org"
            url = NSURL(string: "http://blogs.socsd.org/pburgos")!
            website.setTitle(String(url), forState: .Normal)
            return
        }
        else if (selectedTeach == "Ms. Castelli"){
            self.roomNumber.text = "Room: C-3"
            email.setTitle("pcastelli@socsd.org", forState: .Normal)
            recipients = "pcastelli@socsd.org"
            url = NSURL(string: "https://www.socsd.org")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Ms. Crowe"){
            self.roomNumber.text = "Room: 207"
            email.setTitle("ccrowe@socsd.org", forState: .Normal)
            recipients = "ccrowe@socsd.org"
            url = NSURL(string: "http://blogs.socsd.org/cnilson/")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Ms. Moloney"){
            self.roomNumber.text = "Room: C-6"
            email.setTitle("emoloney@socsd.org", forState: .Normal)
            recipients = "emoloney@socsd.org"
            url = NSURL(string: "https://blogs.socsd.org/emoloney/")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Ms. Moskowitz"){
            self.roomNumber.text = "Room: C-7"
            email.setTitle("smoskowitz@socsd.org", forState: .Normal)
            recipients = "smoskowitz@socsd.org"
            url = NSURL(string: "http://blogs.socsd.org/smoskowitz/")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Ms. Root"){
            self.roomNumber.text = "Room: C-1"
            email.setTitle("mroot@socsd.org", forState: .Normal)
            recipients = "mroot@socsd.org"
            url = NSURL(string: "https://www.socsd.org")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Ms. Bruno"){
            self.roomNumber.text = "Room: C-4"
            email.setTitle("mstillo@socsd.org", forState: .Normal)
            recipients = "mstillo@socsd.org"
            url = NSURL(string: "https://www.socsd.org")!
            website.setTitle(String(url), forState: .Normal)
            return
            
        }
        if (selectedTeach == "Mr. Borawski"){
            self.roomNumber.text = "???"
            email.setTitle("mborawski@socsd.org", forState: .Normal)
            recipients = "mborawski@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return //.setTitle("Ext: 7754", forState: .Normal)
        } else if (selectedTeach == "Ms. Carroll") {
            self.roomNumber.text = "???"
            email.setTitle("bcarroll@socsd.org", forState: .Normal)
            recipients = "bcarroll@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return //.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Mr. DiDomenico") {
            self.roomNumber.text = "Room: 408"
            email.setTitle("adidomenico@socsd.org", forState: .Normal)
            recipients = "adidomenico@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Ms. Drivas") {
            self.roomNumber.text = "Room: 306"
            email.setTitle("cdrivas@socsd.org", forState: .Normal)
            recipients = "cdrivas@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1724", forState: .Normal)
        } else if (selectedTeach == "Mr. Ferraro") {
            self.roomNumber.text = "???"
            email.setTitle("jferraro@socsd.org", forState: .Normal)
            recipients = "jferraro@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Mr. Graney") {
            self.roomNumber.text = "???"
            email.setTitle("lgraney@socsd.org", forState: .Normal)
            recipients = "lgraney@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Mr. Laskow") {
            self.roomNumber.text = "Room: 423"
            email.setTitle("glaskow@socsd.org", forState: .Normal)
            recipients = "glaskow@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1748", forState: .Normal)
        } else if (selectedTeach == "Mr.Muscat") {
            self.roomNumber.text = "Room: 412"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            email.setTitle("smuscat@socsd.org", forState: .Normal)
            recipients = "smuscat@socsd.org"
            return//.setTitle("Ext: 1758", forState: .Normal)
        } else if (selectedTeach == "Mr. Patmos") {
            self.roomNumber.text = "???"
            email.setTitle("mpatmos@socsd.org", forState: .Normal)
            recipients = "mpatmos@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Mr. Robertson") {
            self.roomNumber.text = "Room: 417"
            email.setTitle("mrobertson@socsd.org", forState: .Normal)
            recipients = "mrobertson@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1744", forState: .Normal)
        } else if (selectedTeach == "Ms. Rosenthal") {
            self.roomNumber.text = "Room: 411"
            email.setTitle("arosenthal@socsd.org", forState: .Normal)
            recipients = "arosenthal@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1759", forState: .Normal)
        } else if (selectedTeach == "Mr. Sherman") {
            self.roomNumber.text = "Room: 421"
            email.setTitle("ssherman@socsd.org ", forState: .Normal)
            recipients = "ssherman@socsd.org "
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1747", forState: .Normal)
        } else if (selectedTeach == "Mr. Silver") {
            self.roomNumber.text = "Room: 426"
            email.setTitle("ssilver@socsd.org", forState: .Normal)
            recipients = "ssilver@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1749", forState: .Normal)
        } else if (selectedTeach == "Ms. Smith") {
            self.roomNumber.text = "Room: 422"
            email.setTitle("bsmith@socsd.org", forState: .Normal)
            recipients = "bsmith@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1742", forState: .Normal)
        }
        if (selectedTeach == "Ms. Benecke"){
            self.roomNumber.text = "Room: 307"
            email.setTitle("jbenecke@socsd.org", forState: .Normal)
            recipients = "jbenecke@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            return//.setTitle("Ext: 7705", forState: .Normal)
        } else if (selectedTeach == "Ms. Braunagel"){
            self.roomNumber.text = "Room: 305"
            //.setTitle("Ext: 7702", forState: .Normal)
            email.setTitle("dbraunagel@socsd.org", forState: .Normal)
            recipients = "dbraunagel@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return
        } else if (selectedTeach == "Mr. Donovan"){
            self.roomNumber.text = "Room: 200"
            email.setTitle("jdonovan@socsd.org", forState: .Normal)
            recipients = "jdonovan@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7744", forState: .Normal)
        } else if (selectedTeach == "Mr. Doremus"){
            self.roomNumber.text = "Room: 304"
            email.setTitle("ddoremus@socsd.org", forState: .Normal)
            recipients = "ddoremus@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7858", forState: .Normal)
        } else if (selectedTeach == "Ms. Jacobs"){
            self.roomNumber.text = "Room: 208"
            email.setTitle("ljacobs@socsd.org", forState: .Normal)
            recipients = "ljacobs@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7745", forState: .Normal)
        } else if (selectedTeach == "Mr. Kavanagh"){
            self.roomNumber.text = "Room: 303"
            email.setTitle("pkavanagh@socsd.org", forState: .Normal)
            recipients = "pkavanagh@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7751", forState: .Normal)
        } else if (selectedTeach == "Mr. Kousoulas"){
            self.roomNumber.text = "Room: 310"
            email.setTitle("ekousoulas@socsd.org", forState: .Normal)
            recipients = "ekousoulas@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7744", forState: .Normal)
        } else if (selectedTeach == "Mr. Marino"){
            self.roomNumber.text = "Room: ???"
            email.setTitle("dmarino@socsd.org", forState: .Normal)
            recipients = "dmarino@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            
            //.setTitle("Ext:", forState: .Normal)
            //.enabled = false
            
            //  //.titleLabel?.textColor = UIColor.grayColor()
            return
        } else if (selectedTeach == "Ms. O’Brien"){
            self.roomNumber.text = "Room: 206"
            email.setTitle("cobrien@socsd.org", forState: .Normal)
            recipients = "cobrien@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7709", forState: .Normal)
        } else if (selectedTeach == "Ms. Murphy"){
            self.roomNumber.text = "Room: ???"
            email.setTitle("bmurphy@socsd.org", forState: .Normal)
            recipients = "bmurphy@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7765", forState: .Normal)
        } else if (selectedTeach == "Ms. Premus"){
            self.roomNumber.text = "Room: 315"
            email.setTitle("mpremus@socsd.org", forState: .Normal)
            recipients = "mpremus@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7759", forState: .Normal)
        } else if (selectedTeach == "Mr. Resnikoff"){
            self.roomNumber.text = "Room: 301"
            email.setTitle("sresnikoff@socsd.org", forState: .Normal)
            recipients = "sresnikoff@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            return//.setTitle("Ext: 7748", forState: .Normal)
        } else if (selectedTeach == "Ms. Starink"){
            self.roomNumber.text = "Room: 309"
            email.setTitle("tstarink@socsd.org", forState: .Normal)
            recipients = "tstarink@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7771", forState: .Normal)
        }
        if (selectedTeach == "Ms. Calcaterra"){
            self.roomNumber.text = "???"
            email.setTitle("lcalcaterra@socsd.org", forState: .Normal)
            recipients = "lcalcaterra@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7857", forState: .Normal)
        } else if (selectedTeach == "Ms. Carella"){
            self.roomNumber.text = "???"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            email.setTitle("acarella@socsd.org", forState: .Normal)
            recipients = "acarella@socsd.org"
            return//.setTitle("Ext: 7254", forState: .Normal)
        } else if (selectedTeach == "Ms. Dowling-Murphy"){
            self.roomNumber.text = "???"
            email.setTitle("mdowling@socsd.org", forState: .Normal)
            recipients = "mdowling@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7767", forState: .Normal)
        } else if (selectedTeach == "Ms. Duffy"){
            self.roomNumber.text = "???"
            url = NSURL(string: "https://www.google.com")!
            email.setTitle("fduffy@socsd.org", forState: .Normal)
            recipients = "fduffy@socsd.org"
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7739", forState: .Normal)
        } else if (selectedTeach == "Ms. Erickson"){
            self.roomNumber.text = "???"
            email.setTitle("berickson@socsd.org", forState: .Normal)
            recipients = "berickson@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7792", forState: .Normal)
        } else if (selectedTeach == "Ms. Stranges"){
            self.roomNumber.text = "???"
            email.setTitle("dstranges@socsd.org", forState: .Normal)
            recipients = "dstranges@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7830", forState: .Normal)
        } else if (selectedTeach == "Ms. Gleeson"){
            self.roomNumber.text = "???"
            email.setTitle("sgleeson@socsd.org", forState: .Normal)
            recipients = "sgleeson@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7783", forState: .Normal)
        } else if (selectedTeach == "Mr. Matulac"){
            self.roomNumber.text = "???"
            email.setTitle("mmatulac@socsd.org", forState: .Normal)
            recipients = "mmatulac@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7710", forState: .Normal)
        } else if (selectedTeach == "Ms. Lefkow"){
            self.roomNumber.text = "???"
            email.setTitle("lsorreselefkow@socsd.org", forState: .Normal)
            recipients = "lsorreselefkow@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7734", forState: .Normal)
        } else if (selectedTeach == "Mr. Stanford"){
            self.roomNumber.text = "???"
            email.setTitle("mstanford@socsd.org", forState: .Normal)
            recipients = "mstanford@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7772", forState: .Normal)
        }
        
        if (selectedTeach == "Mr. Adler"){
            self.roomNumber.text = "Room: 325"
            email.setTitle("badler@socsd.org", forState: .Normal)
            recipients = "badler@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1739", forState: .Normal)
        } else if (selectedTeach == "Mr. Desantis") {
            self.roomNumber.text = "???"
            email.setTitle("bcarroll@socsd.org", forState: .Normal)
            recipients = "bcarroll@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1755", forState: .Normal)
        } else if (selectedTeach == "Mr. Emmert") {
            self.roomNumber.text = "Room: 408"
            email.setTitle("adidomenico@socsd.org", forState: .Normal)
            recipients = "adidomenico@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("", forState: .Normal)
        } else if (selectedTeach == "Mr. Keelty") {
            self.roomNumber.text = "Room: 306"
            email.setTitle("cdrivas@socsd.org", forState: .Normal)
            recipients = "cdrivas@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1724", forState: .Normal)
        }
        if (selectedTeach == "Mr. Adler"){
            self.roomNumber.text = "Room: 325"
            email.setTitle("badler@socsd.org", forState: .Normal)
            recipients = "badler@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1739", forState: .Normal)
        } else if (selectedTeach == "Mr. Cohn") {
            self.roomNumber.text = "Room: ???"
            email.setTitle("scohn@socsd.org", forState: .Normal)
            recipients = "scohn@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: ??", forState: .Normal)
        } else if (selectedTeach == "Ms. Farish") {
            self.roomNumber.text = "Room: ???"
            email.setTitle("nfarish@socsd.org", forState: .Normal)
            recipients = "nfarish@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: ???", forState: .Normal)
        } else if (selectedTeach == "Mr. Clinton") {
            self.roomNumber.text = "Room: 813"
            email.setTitle("eclinton@socsd.org", forState: .Normal)
            recipients = "eclinton@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1795", forState: .Normal)
        } else if (selectedTeach == "Mr. Dene") {
            self.roomNumber.text = "Room: ???"
            email.setTitle("pdene@socsd.org", forState: .Normal)
            recipients = "pdene@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
           return //.setTitle("Ext: ????", forState: .Normal)
        } else if (selectedTeach == "Ms. Distante") {
            self.roomNumber.text = "Room: 316"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            email.setTitle("kdistante@socsd.org", forState: .Normal)
            recipients = "kdistante@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            return//.setTitle("Ext: 1734", forState: .Normal)
        } else if (selectedTeach == "Mr. Francesco") {
            self.roomNumber.text = "Room: 324"
            email.setTitle("mfrancesco@socsd.org ", forState: .Normal)
            recipients = "mfrancesco@socsd.org "
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1740", forState: .Normal)
        } else if (selectedTeach == "Mr. Keelty") {
            self.roomNumber.text = "Room: 423"
            email.setTitle("jkeelty@socsd.org", forState: .Normal)
            recipients = "jkeelty@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1737", forState: .Normal)
        } else if (selectedTeach == "Ms. Kilkelly") {
            self.roomNumber.text = "Room: 801"
            email.setTitle("pkilkelly@socsd.org", forState: .Normal)
            recipients = "pkilkelly@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1791", forState: .Normal)
        } else if (selectedTeach == "Ms. Lai") {
            self.roomNumber.text = "Room: "
            email.setTitle("nlai@socsd.org", forState: .Normal)
            recipients = "nlai@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1791", forState: .Normal)
        } else if (selectedTeach == "Mr. Lorusso") {
            self.roomNumber.text = "Room: ???"
            email.setTitle("clorusso@socsd.org", forState: .Normal)
            recipients = "clorusso@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: ???", forState: .Normal)
        } else if (selectedTeach == "Mr. Newburger") {
            self.roomNumber.text = "Room: C - 8"
            email.setTitle("bnewburger@socsd.org", forState: .Normal)
            recipients = "bnewburger@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1824", forState: .Normal)
        } else if (selectedTeach == "Mr. Purkis") {
            self.roomNumber.text = "Room: 800"
            email.setTitle("spurkis@socsd.org", forState: .Normal)
            recipients = "spurkis@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1790", forState: .Normal)
        } else if (selectedTeach == "Mr. Rafferty") {
            self.roomNumber.text = "Room: 807"
            email.setTitle("drafferty@socsd.org", forState: .Normal)
            recipients = "drafferty@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1793", forState: .Normal)
        }
        if (selectedTeach == "Ms. Biggs"){
            self.roomNumber.text = "Room: ???"
            email.setTitle("abiggs@socsd.org", forState: .Normal)
            recipients = "abiggs@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1224", forState: .Normal)
        } else if (selectedTeach == "Ms. Grasso") {
            self.roomNumber.text = "Room: 707"
            email.setTitle("dgrasso@socsd.org", forState: .Normal)
            recipients = "dgrasso@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7731", forState: .Normal)
        } else if (selectedTeach == "Mr. Hughes") {
            self.roomNumber.text = "Room: 951"
            email.setTitle("whughes@socsd.org", forState: .Normal)
            recipients = "whughes@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1870", forState: .Normal)
        } else if (selectedTeach == "Mr. Ko") {
            self.roomNumber.text = "Room: 306"
            email.setTitle("ybko@socsd.org", forState: .Normal)
            recipients = "ybko@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7743", forState: .Normal)
        } else if (selectedTeach == "Ms. B. Labrake") {
            self.roomNumber.text = "Room: 713"
            email.setTitle("blabrake@socsd.org", forState: .Normal)
            recipients = "blabrake@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7766", forState: .Normal)
        } else if (selectedTeach == "Ms. L. Labrake") {
            self.roomNumber.text = "Room: ???"
            email.setTitle("llabrake@socsd.org", forState: .Normal)
            recipients = "llabrake@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 7764", forState: .Normal)
        } else if (selectedTeach == "Mr. Rossi") {
            self.roomNumber.text = "Room: 956"
            email.setTitle("jrossi@socsd.org", forState: .Normal)
            recipients = "jrossi@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1799", forState: .Normal)
        } else if (selectedTeach == "Mr. Wagoner") {
            self.roomNumber.text = "Room: 954"
            email.setTitle("rwagoner@socsd.org", forState: .Normal)
            recipients = "rwagoner@socsd.org"
            url = NSURL(string: "https://www.google.com")!
            website.setTitle(String(url), forState: .Normal)
            return//.setTitle("Ext: 1798", forState: .Normal)
        }
        
        

    }
    @IBAction func website(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(url)
    }
    
    //Email
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
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    

}