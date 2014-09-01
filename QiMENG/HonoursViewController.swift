//
//  HonoursViewController.swift
//  QiMENG
//
//  Created by QiMengJin on 14-9-1.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class HonoursViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let leftBtn = UIButton(frame: CGRectMake(0, 0, 44, 44))
//        leftBtn.setTitle("", forState: <#UIControlState#>)
        leftBtn.setImage(UIImage(named: "arrow-left"), forState: UIControlState.Normal)
        leftBtn.addTarget(self, action: "leftBtnCall:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        
        
    }
    func leftBtnCall(sender:AnyObject?){
        self.navigationController.popViewControllerAnimated(true)
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
