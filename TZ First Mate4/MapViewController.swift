//
//  MapViewController.swift
//  TZ First Mate4
//
//  Created by Jake on 5/17/16.
//  Copyright © 2016 Jake Laddis. All rights reserved.
//

import Foundation
import UIKit



class MapViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var MapIconTab: UITabBarItem!

    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        scroller.delegate = self
        scroller.bounces = false
        scroller.minimumZoomScale = 0.5
        scroller.maximumZoomScale = 1.4
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return map
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }







}