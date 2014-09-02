//
//  PhotoCollectionViewCell.swift
//  QiMENG
//
//  Created by QiMengJin on 14-9-2.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
//    var iconMainView:UILabel!
    
    var iconImageView:UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        iconMainView = UILabel(frame: CGRectMake(0, 0, 50, 50))
//        iconMainView.textAlignment = NSTextAlignment.Center
//        iconMainView.backgroundColor = UIColor.orangeColor()
//        self.addSubview(iconMainView)
        self.backgroundColor = UIColor.clearColor()
        
        iconImageView = UIImageView(frame: self.bounds)
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = UIViewContentMode.Center
        self.addSubview(iconImageView);
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
