//
//  XPPickToolBarView.swift
//  XPPickerViewExample
//
//  Created by xyj on 2018/1/3.
//  Copyright © 2018年 xyj. All rights reserved.
//

import UIKit

class XPPickToolBarView: UIToolbar {
    
    func initWithCustomerTool() -> UIToolbar {
        self.barTintColor = UIColor.white
        let spaceItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        self.items = [cancelItem,spaceItem,spaceItem,sureItem]
        self.backgroundColor = UIColor.init(red: 246/255.0, green: 248/255.0, blue: 250/255.0, alpha: 1)
        return self
    }
    
    lazy var cancelItem: UIBarButtonItem = {
        let button = UIButton.init(type: .custom)
        let item = UIBarButtonItem.init(customView: button)
        button.setTitle("取消", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return item
    }()
    
    lazy var sureItem: UIBarButtonItem = {
        let button = UIButton.init(type: .custom)
        let item = UIBarButtonItem.init(customView: button)
        button.setTitle("确定", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return item
    }()
    
}

extension UIBarButtonItem {
    public func acceptBtn() -> UIButton {
        for view in (self.customView?.subviews)! {
            if let btnView = view as? UIButton {
                return btnView
            } else {
                continue
            }
        }
        return UIButton()
    }
    
    public func acceptBtn(title: String) -> UIButton? {
        let btn = self.customView as! UIButton
        if btn.title(for: .normal) == title {
            return btn
        }
        return nil
    }
}
