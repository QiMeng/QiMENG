//
//  Personal.swift
//  QiMENG
//
//  Created by QiMENG on 14-8-31.
//  Copyright (c) 2014年 QiMeng_LYS. All rights reserved.
//

import Foundation

class Personal : NSObject {
    class func shareInstance()->Personal{
        struct Singleton{
            static var predicate:dispatch_once_t = 0
            static var instance:Personal? = nil
        }
        dispatch_once(&Singleton.predicate,{
            Singleton.instance=Personal()
            }
        )
        return Singleton.instance!
    }
    
    var name: String = ""   //姓名
    var gender: String = ""     //性别
    var birth: String = ""      //生日
    var address: String = ""     //地址
    var tables: NSMutableArray = NSMutableArray()
    
}