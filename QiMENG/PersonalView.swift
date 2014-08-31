//
//  PersonalView.swift
//  QiMENG
//
//  Created by QiMENG on 14-8-31.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class PersonalView: UIView {

    var genderLabel: UILabel?     //性别
    var birthLabel: UILabel?      //生日
    var addressLabel: UILabel?     //地址
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        let width = frame.size.width/3.0
        let heigth = frame.size.height
        
        genderLabel = UILabel(frame: CGRectMake(0, 0, width, heigth))
        genderLabel?.font = UIFont(name: kBaseFont, size: 17)
        genderLabel?.textAlignment = NSTextAlignment.Center
        genderLabel?.backgroundColor = UIColor.clearColor()
        genderLabel?.textColor = UIColor.blackColor()
        self.addSubview(genderLabel!)
        
        birthLabel = UILabel(frame: CGRectMake(width, 0, width, heigth))
        birthLabel?.font = UIFont(name: kBaseFont, size: 17)
        birthLabel?.textAlignment = NSTextAlignment.Center
        birthLabel?.backgroundColor = UIColor.clearColor()
        birthLabel?.textColor = UIColor.blackColor()
        self.addSubview(birthLabel!)
        
        addressLabel = UILabel(frame: CGRectMake(width * 2, 0, width, heigth))
        addressLabel?.font = UIFont(name: kBaseFont, size: 17)
        addressLabel?.textAlignment = NSTextAlignment.Center
        addressLabel?.backgroundColor = UIColor.clearColor()
        addressLabel?.textColor = UIColor.blackColor()
        self.addSubview(addressLabel!)
        
    }
    
    
    func reloadView(){
        
        genderLabel?.text = Personal.shareInstance().gender
        
        birthLabel?.text = Personal.shareInstance().birth
        
        addressLabel?.text = Personal.shareInstance().address
        
    }
    
    
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        //获得处理的上下文
        var context = UIGraphicsGetCurrentContext();
        //设置线条样式
        CGContextSetLineCap(context, kCGLineCapRound);
        //设置线条粗细宽度
        CGContextSetLineWidth(context, 1.0);
        //设置颜色
        CGContextSetRGBStrokeColor(context, 230/255.0, 230/255.0, 230/255.0, 1.0);
        //开始一个起始路径
        CGContextBeginPath(context);
        
        CGContextMoveToPoint(context, CGRectGetMaxX(genderLabel!.frame), 0);
        CGContextAddLineToPoint(context, CGRectGetMaxX(genderLabel!.frame), self.frame.size.height);
        
        CGContextMoveToPoint(context, CGRectGetMaxX(birthLabel!.frame), 0);
        CGContextAddLineToPoint(context, CGRectGetMaxX(birthLabel!.frame), self.frame.size.height );
        
        CGContextMoveToPoint(context,0, self.frame.size.height);
        CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height );
        
        CGContextStrokePath(context);
        
    }


}
