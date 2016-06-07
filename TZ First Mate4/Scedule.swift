//
//  Scedule.swift
//  TZ First Mate4
//
//  Created by Mitchell Jacobs on 5/6/16.
//  Copyright © 2016 Tappan Zee High School Computer Science Club. All rights reserved.
//

import Foundation
import UIKit

class Scedule {
    
    
    var sced : [String] = ["","","","","","","","",""]
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    
    
    
    func Scedule(savedBefore:Bool){
        var y:Bool = savedBefore;
        
        
        //sets the keys
        for q in 0 ..< periodKeys.count {
            periodKeys[q] = "Period\(q+1)"
        }
        
        
        
        
        for i in 0 ..< sced.count{
            if(y){
                if(!(prefs.stringForKey(periodKeys[i]) == nil)){
                    sced[i] = prefs.stringForKey(periodKeys[i])!
                }else{
                    y = false
                    sced[i] = "Free"// restarts
                }
            }else{
                sced[i] = "Free"
            }
            
        }
        
    }
    
    private var periodKeys: [String] = ["","","","","","","","",""]
    
    func getPeriodKey(x:Int) -> String{
        
        let ret = periodKeys[x-1]
        
        return ret
    }
    
    
}
