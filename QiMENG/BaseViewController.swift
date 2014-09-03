//
//  BaseViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-8-30.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    
    var titleLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController.navigationBar.translucent = false;
        self.edgesForExtendedLayout = UIRectEdge.None//UIRectEdgeNone
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func navTitle(title:String?) {
        
        if titleLabel == nil {
            
            titleLabel = UILabel(frame: CGRectMake(0, 0, 200, 44))
            self.navigationItem.titleView = titleLabel
            
            titleLabel?.textColor = UIColor.whiteColor()
            titleLabel?.backgroundColor = UIColor.clearColor()
            titleLabel?.textAlignment = NSTextAlignment.Center
            titleLabel?.font = UIFont(name: kBaseFont, size: 17)
        }
        
        titleLabel?.text = title
        
    }
    

}