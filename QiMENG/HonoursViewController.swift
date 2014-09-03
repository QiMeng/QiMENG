//
//  HonoursViewController.swift
//  QiMENG
//
//  Created by QiMengJin on 14-9-1.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class HonoursViewController: BaseViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var myCollectionView : UICollectionView!
    
    var itemArray = NSArray()
    
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
        self.navigationController.popViewControllerAnimated(true)
    }
    
    func initUI(){
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        myCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        
        myCollectionView.registerClass(PhotoCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.autoresizingMask = UIViewAutoresizing.FlexibleHeight|UIViewAutoresizing.FlexibleTopMargin
        myCollectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(myCollectionView)
        
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        let iden = "cell"

        var cell:PhotoCollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(iden, forIndexPath: indexPath) as? PhotoCollectionViewCell
        
        
        let item = itemArray.objectAtIndex(indexPath.row) as NSDictionary
        
        var imgurl = item.objectForKey("imgurl") as String
        
        cell?.iconImageView.sd_setImageWithURL(NSURL.URLWithString(imgurl), completed: { (image,NSError,SDImageCacheType,NSURL) -> Void in

            cell?.iconImageView.image = image.resizedImageByWidth( UInt((self.view.frame.size.width - CGFloat(kBasePlace) * 3 ) * 0.5 ))
            
            println()
            
        })
        
        return cell
        

   
    }

    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(kBasePlace)
    }
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(kBasePlace)
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        
        let width = (self.view.frame.size.width - CGFloat(kBasePlace)*3 )*0.5
        
        return CGSizeMake( width , width)
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(CGFloat(kBasePlace), CGFloat(kBasePlace), CGFloat(kBasePlace), CGFloat(kBasePlace));
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
