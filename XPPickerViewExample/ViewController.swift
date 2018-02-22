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
        

//        let data = PickerData.init(data: [ColumnPickerData.init(key: "workID", value: "jamal", data: nil),
//                               ColumnPickerData.init(key: "workID", value: "lixp", data: nil),
//                               ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil),
//                               ColumnPickerData.init(key: "workID", value: "jamalping", data: nil)])

//        let pickerView = XPPickerView.init(.recentYear)
//        pickerView.show()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    @IBAction func showOneColume(_ sender: Any) {
//        let data = PickerData.init(data: [ColumnPickerData.init(key: "workID", value: "jamal", data: nil),
//                                          ColumnPickerData.init(key: "workID", value: "lixp", data: nil),
//                                          ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil),
//                                          ColumnPickerData.init(key: "workID", value: "jamalping", data: nil)])
//
//        XPPickerView.showPickerView(data) {
//            print($0.0,$0.1)
//        }
        let pickerView = XPPickerView.init(.recentYear)
        pickerView.show()
    }
    
    @IBAction func showTwoColume(_ sender: Any) {
//        let data = PickerData.init(data:
//            [ColumnPickerData.init(key: "workID", value: "jamal", data: [
//                ColumnPickerData.init(key: "workID", value: "jamal", data: nil),
//                ColumnPickerData.init(key: "workID", value: "jamal", data: nil),
//                ColumnPickerData.init(key: "workID", value: "jamal", data: nil)]),
//             ColumnPickerData.init(key: "workID", value: "lixp", data: [
//                ColumnPickerData.init(key: "workID", value: "lixp", data: nil),
//                ColumnPickerData.init(key: "workID", value: "lixp", data: nil),
//                ColumnPickerData.init(key: "workID", value: "lixp", data: nil)]),
//             ColumnPickerData.init(key: "workID", value: "lixiaoping", data: [
//                ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil),
//                ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil),
//                ColumnPickerData.init(key: "workID", value: "lixiaoping", data: nil)]),
//             ColumnPickerData.init(key: "workID", value: "jamalping", data: [
//                ColumnPickerData.init(key: "workID", value: "jamalping", data: nil),
//                ColumnPickerData.init(key: "workID", value: "jamalping", data: nil),
//                ColumnPickerData.init(key: "workID", value: "jamalping", data: nil)])])
//
//        XPPickerView.showPickerView(data) {
//            print($0.0,$0.1)
//        }
        let pickerView = XPPickerView.init(.bussiness)
        pickerView.show()
    }
    @IBAction func showThreeColume(_ sender: Any) {
        let pickerView = XPPickerView.init(.cityTwoPicker)
        pickerView.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

