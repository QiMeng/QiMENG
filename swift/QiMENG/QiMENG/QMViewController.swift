//
//  BaseViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-9-11.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class QMViewController: UIViewController {

    
    var titleLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
