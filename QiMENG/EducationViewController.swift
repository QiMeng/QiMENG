//
//  EducationViewController.swift
//  QiMENG
//
//  Created by QiMENG on 14-9-3.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController , iCarouselDataSource,iCarouselDelegate {

    var itemArray = NSArray()
    
    var myCarousel : iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let leftBtn = UIButton(frame: CGRectMake(0, 0, 44, 44))
        
        leftBtn.setImage(UIImage(named: "arrow-left"), forState: UIControlState.Normal)
        leftBtn.addTarget(self, action: "leftBtnCall:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        initUI()
    }
    
    func leftBtnCall(sender:AnyObject?){
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func initUI() {
        
        myCarousel = iCarousel(frame: self.view.bounds)
        self.view.addSubview(myCarousel)
        
        myCarousel.delegate = self
        myCarousel.dataSource = self
        myCarousel.type = iCarouselType.CoverFlow
        myCarousel.clipsToBounds = true
        
        myCarousel.autoresizingMask = UIViewAutoresizing.FlexibleHeight|UIViewAutoresizing.FlexibleBottomMargin|UIViewAutoresizing.FlexibleTopMargin
        
    }
    
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int {
        return itemArray.count
    }
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: UIView!) -> UIView! {
        
        var itemView = view as UIImageView?
        
        if itemView == nil {
            
            itemView = UIImageView(frame: CGRectMake(0, 0, 250, 300))
            
//            itemView?.backgroundColor = UIColor.grayColor()
            
//            itemView?.layer.borderWidth = 3
            
//            itemView?.layer.borderColor = UIColor.purpleColor().CGColor
            
            itemView?.contentMode = UIViewContentMode.Center
            
        }
        
        
        let item = itemArray.objectAtIndex(index) as NSDictionary
        
        var imgurl = item.objectForKey("imgurl") as String
        
        itemView?.sd_setImageWithURL(NSURL.URLWithString(imgurl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!), completed: { (image,NSError,SDImageCacheType,NSURL) -> Void in
            
            if image != nil {
                itemView?.image = image.resizedImageByWidth( UInt(250))
            }
            
            println(imgurl)
            
        })

        return itemView
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
