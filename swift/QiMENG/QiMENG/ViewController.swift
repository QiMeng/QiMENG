//
//  ViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-9-11.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class ViewController: QMViewController ,UITableViewDelegate,UITableViewDataSource {

    var getASI :ASIHTTPRequest!
    
    var myTableView :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navTitle("Swift")
        
        initUI()
        
        
        didRequest("http://qimeng.github.io/phone/data.html", loadString: "加载数据中")
    }
    
    func initUI() {
        
        if myTableView == nil {
            myTableView = UITableView(frame: self.view.bounds)
            myTableView.backgroundColor = kBaseColor
            myTableView.delegate = self
            myTableView.dataSource = self
            self.view.addSubview(myTableView)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
//        let height = tableView.rectForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)).height
//        
//        return myTableView.frame.size.height - height * 4
        
        return 0

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "cell"
        // may be no value, so use optional
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil { // no value
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
//            cell?.textLabel.font = UIFont(name: kBaseFont, size: 17)
//            cell?.detailTextLabel.font = UIFont(name: kBaseFont, size: 17)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell?.accessoryView = UIImageView(image: UIImage(named: "arrow-right"))
            
        }
        
        
        return cell!
    }
    
    
    
    func didRequest(url:String , loadString:String) {
        
        SVProgressHUD.showWithStatus(loadString)
        //网络请求
        clearASI(getASI)
        
        getASI = ASIHTTPRequest(URL: NSURL.URLWithString(url))
        
        getASI.delegate = self
        getASI.didFinishSelector = "didFinishSelector:"
        getASI.didFailSelector = "didFailSelector:"
        getASI.startAsynchronous()
        
    }

    func clearASI(sender: ASIHTTPRequest?) {
        //关闭ASI
        sender?.cancel()
        sender?.clearDelegatesAndCancel()
    }
    
    func didFinishSelector(sender : ASIHTTPRequest) {
        //网络请求成功
        let requestString = sender.responseString()
        let data: AnyObject! = requestString.objectFromJSONString()
        
        if data is NSDictionary {
            NSLog("NSDictionary", "data")
            
            
            
            SVProgressHUD.showSuccessWithStatus("请求成功")

        }else {
            
            SVProgressHUD.showErrorWithStatus("数据格式错误!")
        }
        
    }
    
    func didFailSelector(sender : ASIHTTPRequest) {
        //网络请求失败
        clearASI(getASI)
        
        SVProgressHUD.showErrorWithStatus("请求失败")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

