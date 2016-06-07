//
//  CalendarViewController.swift
//  TZ First Mate4
//
//  Created by Mitchell Jacobs on 5/24/16.
//  Copyright © 2016 Michael Morales. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class CalendarViewController: UIViewController , UIWebViewDelegate{

    
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = NSBundle.mainBundle().URLForResource("Calendar", withExtension: "html")
            webView.loadRequest(NSURLRequest(URL: url!))
        webView.delegate = self

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}