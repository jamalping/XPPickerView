//
//  ViewController.swift
//  XPPickerViewExample
//
//  Created by xyj on 2018/1/3.
//  Copyright © 2018年 xyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pickView: XPPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let data = PickerData.init(data: [ColumnPickerData.init(key: "workID", value: "jamal", data: nil),
                               ColumnPickerData.init(key: "workID", value: "lixp", data: nil),
                               ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil),
                               ColumnPickerData.init(key: "workID", value: "jamalping", data: nil)])
        pickView = XPPickerView.init(data) {
            print($0.0,$0.1)
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3) {
            self.pickView?.show()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pickView?.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

