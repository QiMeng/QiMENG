//
//  ViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-8-30.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//
// 个人信息
// 学历
// 荣誉
// 培训经历

import UIKit

class ViewController: BaseViewController , UITableViewDataSource,UITableViewDelegate{
    
    var httpASI_GET :ASIHTTPRequest?
    
    var myTableView: UITableView?
    
    
    var headerImageView : UIImageView?
    
    var headerView : UIImageView?
    
    var headerLabel : UILabel?
    
    var personalView : PersonalView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 0/255.0, green: 128/255.0, blue: 255/255.0, alpha: 1)
        self.navigationController.navigationBar.barTintColor = self.view.backgroundColor
        
        let mySegment = UISegmentedControl(items: ["Personal","Project"] )
        mySegment.tintColor = UIColor.whiteColor()
        self.navigationItem.titleView = mySegment
        mySegment.selectedSegmentIndex = 0
        
        let rightBtn = UIButton(frame: CGRectMake(0, 0, 44, 44))
        rightBtn.setImage(UIImage(named: "cw"), forState: UIControlState.Normal)
        rightBtn.addTarget(self, action: "rigthBtnCall:", forControlEvents: UIControlEvents.TouchUpInside)
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        

        
        rigthBtnCall(nil)
    }
    func rigthBtnCall(sender:AnyObject?){
        didRequest("http://qimeng.github.io/phone/introduction.html", loadString: "加载数据中")
    }
    func createTableView(){
        if myTableView == nil {
            myTableView = UITableView(frame: self.view.bounds)
            myTableView?.tableHeaderView = headerView
            myTableView?.dataSource = self
            myTableView?.delegate = self
            myTableView?.autoresizingMask = UIViewAutoresizing.FlexibleHeight|UIViewAutoresizing.FlexibleBottomMargin
            myTableView?.alpha = 0
            myTableView?.backgroundColor = UIColor.clearColor()
            self.view.addSubview(myTableView!)
        }
    }
    func createHeaderView(){
        
        if headerView == nil{
        
            
            headerView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44 - 44 * CGFloat(Personal.shareInstance().tables.count) ))
//            self.view.addSubview(headerView!)
            
            headerView?.backgroundColor = UIColor(red: 0/255.0, green: 128/255.0, blue: 255/255.0, alpha: 1)
            
            headerImageView = UIImageView(frame: CGRectMake(0, 0, headerView!.frame.size.height * 0.8, headerView!.frame.size.height * 0.8))
            headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
            headerView?.addSubview(headerImageView!)
            headerImageView?.center = CGPointMake(headerView!.center.x, headerImageView!.center.y+5)
            //        headerImageView?.layer.borderWidth = 3
            headerImageView?.layer.borderColor = UIColor(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1).CGColor
            headerImageView?.layer.cornerRadius = CGRectGetHeight(headerImageView!.frame)/2.0;
            headerImageView?.layer.masksToBounds = true;
            
            headerLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(headerImageView!.frame), self.view.frame.size.width, headerView!.frame.size.height - CGRectGetMaxY(headerImageView!.frame)));
            headerView?.addSubview(headerLabel!)
            headerLabel?.textColor = UIColor.whiteColor()
            headerLabel?.font = UIFont(name: kBaseFont, size: 17)
            headerLabel?.textAlignment = NSTextAlignment.Center
            
//            headerView?.alpha = 0;
        }
    }
    

    func tableView(tableView: UITableView!, viewForHeaderInSection section: Int) -> UIView! {
        if personalView == nil {
            personalView = PersonalView(frame: CGRectMake(0, CGRectGetMaxY(headerView!.frame), self.view.frame.size.width, 44));
        }
        personalView?.reloadView()

        return personalView
    }
    func tableView(tableView: UITableView!, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return Personal.shareInstance().tables.count
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        
        let cellIdentifier: String = "cell"
        // may be no value, so use optional
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil { // no value
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
            cell?.textLabel.font = UIFont(name: kBaseFont, size: 17)
            cell?.detailTextLabel.font = UIFont(name: kBaseFont, size: 17)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell?.accessoryView = UIImageView(image: UIImage(named: "arrow-right"))

        }
        
        let item = Personal.shareInstance().tables.objectAtIndex(indexPath.row) as NSDictionary

        cell?.textLabel.text = item.objectForKey("label") as String
        cell?.detailTextLabel.text = item.objectForKey("title") as String
//        cell?.imageView.sd_setImageWithURL(NSURL.URLWithString(item.objectForKey("icon") as String))
        
        cell?.imageView.sd_setImageWithURL(NSURL.URLWithString(item.objectForKey("icon") as String), placeholderImage: UIImage(named: "warning"))
        
        return cell
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            cell.accessoryView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/2.0))
        })
        
        
        let item = Personal.shareInstance().tables.objectAtIndex(indexPath.row) as NSDictionary
        
        var classid = item.objectForKey("classid") as String?
        
        var label = item.objectForKey("label") as String?
        
        if classid == "Honours" {
            var ctrl = HonoursViewController()
            ctrl.navTitle(label?)
            ctrl.itemArray = item.objectForKey("table") as NSArray
            self.navigationController.pushViewController(ctrl, animated: true)
        }
        
        
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

        println(requestString)
        
        let data: AnyObject! = requestString.objectFromJSONString()

        if data.isKindOfClass(NSDictionary) {

            let statu = data.objectForKey("STATU") as String
            
            let result = data.objectForKey("RESULT") as NSDictionary
            
            if result.isKindOfClass(NSDictionary) {
            
                var person=Personal.shareInstance()
                person.name = result.objectForKey("name") as String
                person.gender = result.objectForKey("gender") as String
                person.birth = result.objectForKey("birth") as String
                person.address = result.objectForKey("address") as String
                
                let table = result.objectForKey("table") as NSArray
                
                person.tables.removeAllObjects()
                
                person.tables.addObjectsFromArray(table)
                
                
                createHeaderView()
                createTableView()
                
                
                headerLabel?.text = result.objectForKey("name") as String
                
                let headImg = result.objectForKey("headimg") as String
                
                headerImageView?.sd_setImageWithURL(NSURL.URLWithString(headImg))
                
                
                
  
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.myTableView!.alpha = 1
                    self.myTableView!.reloadData()
                })
                
                
                
            }


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

