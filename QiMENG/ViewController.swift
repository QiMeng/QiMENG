//
//  ViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-8-30.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    var httpASI_GET :ASIHTTPRequest?
    
    var headerImageView : UIImageView?
    
    var headerView : UIImageView?
    
    var headerLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mySegment = UISegmentedControl(items: ["Personal","Project"])
        self.navigationItem.titleView = mySegment
        mySegment.selectedSegmentIndex = 0
        
        
        
        headerView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, 150))
        self.view.addSubview(headerView!)

        headerView?.backgroundColor = UIColor(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1)
        
        headerImageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        headerView?.addSubview(headerImageView!)
        headerImageView?.center = CGPointMake(headerView!.center.x, headerImageView!.center.y+10)
//        headerImageView?.layer.borderWidth = 3
        headerImageView?.layer.borderColor = UIColor(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1).CGColor
        headerImageView?.layer.cornerRadius = 50;
        headerImageView?.layer.masksToBounds = true;
        
        headerLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(headerImageView!.frame), self.view.frame.size.width, 35));
        headerView?.addSubview(headerLabel!)
        headerLabel?.textColor = UIColor.whiteColor()
        headerLabel?.font = UIFont(name: kBaseFont, size: 17)
        headerLabel?.textAlignment = NSTextAlignment.Center
        
        
        didRequest("http://qimeng.github.io/phone/introduction.html", loadString: "加载数据中")
    }
    
    func didRequest(url:String , loadString:String) {
        
        SVProgressHUD.showWithStatus(loadString)
        
        clearASI()
        httpASI_GET = ASIHTTPRequest(URL: NSURL.URLWithString(url))
        httpASI_GET!.delegate = self
        httpASI_GET!.didFinishSelector = "didFinishSelector:"
        httpASI_GET!.didFailSelector = "didFailSelector:"
        httpASI_GET!.startAsynchronous()
        
    }
    
    
    func didFinishSelector(sender : ASIHTTPRequest) {
        let requestString = sender.responseString()

        
        let data: AnyObject! = requestString.objectFromJSONString()

        if data.isKindOfClass(NSDictionary) {

            let statu = data.objectForKey("STATU") as String
            
            let result = data.objectForKey("RESULT") as NSDictionary
            
            if result.isKindOfClass(NSDictionary) {
            
                headerLabel?.text = result.objectForKey("name") as String
                
                let headImg = result.objectForKey("headimg") as String
                
                println(headImg)
                headerImageView?.sd_setImageWithURL(NSURL.URLWithString(headImg))
                
            }
//            let alert = UIAlertView(title: "提示", message: statu, delegate: nil, cancelButtonTitle: "确定")
//            alert.show()

        }
        
        SVProgressHUD.showSuccessWithStatus("请求成功")
        
    }
    
    func didFailSelector(sender : ASIHTTPRequest) {
        
        SVProgressHUD.showErrorWithStatus("请求失败")
    }
    
    func clearASI() {
        
        httpASI_GET?.cancel()
        httpASI_GET?.clearDelegatesAndCancel()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

