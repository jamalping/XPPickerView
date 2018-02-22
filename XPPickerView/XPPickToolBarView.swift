//
//  XPPickToolBarView.swift
//  XPPickerViewExample
//
//  Created by xyj on 2018/1/3.
//  Copyright © 2018年 xyj. All rights reserved.
//

import UIKit
//class XPBasePickToolBarView: UIToolbar {
//    
//    func initWithCustomerTool() -> UIToolbar {
//        self.barTintColor = UIColor.white
//        let spaceItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let  spaceItem1 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)   //左边空格
//        spaceItem1.width = 15
//        let  spaceItem2 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        spaceItem2.width = 15
//        self.items = [spaceItem1,cancelItem,spaceItem,spaceItem,spaceItem,sureItem,spaceItem2]
//        self.backgroundColor = UIColor.black
//        return self
//    }
//    
//    func cancelDone() {}
//    
//    func sureDone() {}
//    
//    func allDone() {}
//    
//    // 有的有清除按钮
//    lazy var allItem: UIBarButtonItem = {
//        return self.initWithToolBar(title: "清除", titleColor: .darkGray, self, action: #selector(allDone))
//    }()
//    
//    lazy var cancelItem: UIBarButtonItem = {
//        return self.initWithToolBar(title: "取消", titleColor: .darkGray, self, action: #selector(cancelDone))
//    }()
//    
//    lazy var sureItem: UIBarButtonItem = {
//        return self.initWithToolBar(title: "确定", titleColor: .red, self, action: #selector(sureDone))
//    }()
//    
//    func initWithToolBar(title:String,titleColor:UIColor ,_ target: AnyObject?, action: Selector) -> UIBarButtonItem {
//        
//        let btn:UIButton = UIButton.init(type: .custom)
//        
//        btn.frame =  CGRect(x: 0, y: 0, width: 42, height: 44)
//        
//        btn.setTitle(title, for: .normal)
//        
//        btn.setTitleColor(titleColor, for: .normal)
//        
//        btn.addTarget(target, action: action, for: .touchUpInside)
//        
//        return UIBarButtonItem.init(customView: btn)
//        
//    }
//    
//}
//
