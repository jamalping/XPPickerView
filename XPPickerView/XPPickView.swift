//
//  XYJPickView.swift
//  XPPickerViewExample
//
//  Created by xyj on 2018/1/3.
//  Copyright © 2018年 xyj. All rights reserved.
//

import UIKit


/// pickerView数据源
struct PickerData {
    
    /// 每一列的数据源
    var data: [ColumnPickerData]?
    
    /// pickerView有多少列：（最多支持三列，少于三列随意）
    func getNumberOfComponent() -> Int {
        var numbers = 0
        guard let datas = self.data, datas.count > 0 else {
            return numbers
        }
        numbers += 1
        var secondeColumn = false
        var thirdColumn = false
        datas.forEach { (columnPickerData) in
            if columnPickerData.data?.count ?? 0 > 0 {
                secondeColumn = true
                columnPickerData.data?.forEach({ (cpData) in
                    if cpData.data?.count ?? 0 > 0 {
                        thirdColumn = true
                    }
                })
            }
        }
        if secondeColumn {
            numbers += 1
        }
        if thirdColumn {
            numbers += 1
        }
  
        return numbers
    }
}

/// pickerView每一列的数据模型
struct ColumnPickerData {
    
    /// 隐藏的值：比如id
    var key: String?
    
    /// 要显示出来的值
    var value: String?
    
    /// 下一列的数据源
    var data: [ColumnPickerData]?
}

//let kWindow = UIApplication.shared.keyWindow!

let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width
/// 选择框的高度
fileprivate let pickViewH:CGFloat = 200
/// 选择框的行高
fileprivate let pickViewCellH:CGFloat = 49
/// 工具条的高度
private let toolBarHeight:CGFloat = 44

class XPPickerView: UIView {
    typealias PickerViewCallBack = ((([String],[String])) -> Void)
    
    var keyValueResult: PickerViewCallBack?
    
//    let disposeBag = DisposeBag()
    // MARK: pickview的数据源
    fileprivate var numberOfComponent: (() -> Int)?
    fileprivate var numberOfRowsInComponent: ((_ pickerView: UIPickerView,_ component: Int) -> Int)?
    fileprivate var textOfSelectRow: ((_ pickerView: UIPickerView,_ row: Int, _ component: Int) -> String)?
    fileprivate var getTextSelectRow: ((_ pickerView: UIPickerView) -> ([String], [String]))?
    
    // MARK: pickview的代理方法
    var didSelectRow:((_ pickerView: UIPickerView,_ row: Int,_ component: Int) -> Void)?
    
    /// 组装格式
    var data: PickerData? {
        didSet {
            
        }
    }
    
    static func showPickerView(_ pickerViewData: PickerData, pickerViewCallBack: @escaping PickerViewCallBack) -> Void {
        let pickerView = XPPickerView.init(pickerViewData, pickerViewCallBack: pickerViewCallBack)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3) {
            pickerView.show()
        }
        
    }
    
    convenience init(_ pickerViewData: PickerData, pickerViewCallBack: @escaping PickerViewCallBack) {
        self.init(frame: CGRect.init(x: 0, y: screenHeight-(pickViewH+toolBarHeight), width: screenWidth, height: pickViewH+toolBarHeight))
//        self.frame = CGRect.init(x: 0, y: screenHeight-(pickViewH+toolBarHeight), width: screenWidth, height: pickViewH+toolBarHeight)
        self.backgroundColor = .white
        self.keyValueResult = pickerViewCallBack
        
        self.data = pickerViewData
        ads()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        configePage()
        
        bind()
    }
    
    func ads() {
        /// 设置数据源
        self.numberOfComponent = {
            return self.data!.getNumberOfComponent()
        }
        
        self.numberOfRowsInComponent = { picker,component -> Int in
            let numberComponent = self.data?.getNumberOfComponent() ?? 0
            switch (numberComponent, component) {
            case (1, 0),(2, 0),(3, 0):
                return self.data?.data?.count ?? 0
            case (2, 1), (3, 1):
                let selectedRow = picker.selectedRow(inComponent: 0)
                return self.data?.data?[selectedRow].data?.count ?? 0
            case (3, 2):
                let selectedRow1 = picker.selectedRow(inComponent: 0)
                let selectedRow2 = picker.selectedRow(inComponent: 1)
                return self.data?.data?[selectedRow1].data?[selectedRow2].data?.count ?? 0
            default: return 0
            }
        }
        
        self.textOfSelectRow = {picker ,row, component -> String in
            switch component {
            case 0:
                return self.data?.data?[row].value ?? ""
            case 1:
                let selectedRow = picker.selectedRow(inComponent: 0)
                return self.data?.data?[selectedRow].data?[row].value ?? ""
            case 2:
                let selectedRow1 = picker.selectedRow(inComponent: 0)
                let selectedRow2 = picker.selectedRow(inComponent: 1)
                return self.data?.data?[selectedRow1].data?[selectedRow2].data?[row].value ?? ""
                
            default:
                return ""
            }
        }
        
        self.getTextSelectRow = { pickerView -> ([String],[String]) in
            let numberComponent = self.data?.getNumberOfComponent() ?? 0
            switch numberComponent {
            case 1:
                let selectedRow1 = pickerView.selectedRow(inComponent: 0)
                let component1Data = self.data?.data?[selectedRow1]
                
                let key = component1Data?.key ?? ""
                let value = component1Data?.value ?? ""
                return ([key], [value])
            case 2:
                let selectedRow1 = pickerView.selectedRow(inComponent: 0)
                let selectedRow2 = pickerView.selectedRow(inComponent: 1)
                
                let component1Data = self.data?.data?[selectedRow1]
                let component2Data = component1Data?.data?[selectedRow2]
                
                let key1 = component1Data?.key ?? ""
                let value1 = component1Data?.value ?? ""
                let key2 = component2Data?.key ?? ""
                let value2 = component2Data?.value ?? ""
                return ([key1, key2], [value1, value2])
            case 3:
                let selectedRow1 = pickerView.selectedRow(inComponent: 0)
                let selectedRow2 = pickerView.selectedRow(inComponent: 1)
                let selectedRow3 = pickerView.selectedRow(inComponent: 2)
                
                let component1Data = self.data?.data?[selectedRow1]
                let component2Data = component1Data?.data?[selectedRow2]
                let component3Data = component2Data?.data?[selectedRow3]
                
                let value1 = component1Data?.value ?? ""
                let value2 = component2Data?.value ?? ""
                let value3 = component3Data?.value ?? ""
                let key1 = component1Data?.key ?? ""
                let key2 = component2Data?.key ?? ""
                let key3 = component3Data?.key ?? ""
                
                return ([key1, key2, key3], [value1, value2, value3])
                
            default:
                return ([""],[""])
            }
            
        }
    }
    
    func configePage() {
        addSubview(pickerView)
        addSubview(toolView)
        
        layout()
    }
    
    func layout() {

        toolView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: toolBarHeight)

        pickerView.frame = CGRect.init(x: 0, y: toolBarHeight, width: self.frame.width, height: pickViewH)

    }
    
    func bind() {
        self.toolView.sureItem.acceptBtn(title: "确定")?.addTarget(self, action: #selector(sureDone), for: .touchUpInside)
        
        self.toolView.sureItem.acceptBtn(title: "取消")?.addTarget(self, action: #selector(cancle), for: .touchUpInside)
    }
    // 确定按钮
    @objc func sureDone() -> Void {
        self.hidden()
        
        // 回调
        self.keyValueResult?(self.getTextSelectRow!(self.pickerView))
    }
    
    @objc func cancle() -> Void {
        print("点击了取消")
        self.hidden()
    }
   
    func show() {
        markView.addSubview(self)
        
        UIApplication.shared.keyWindow!.addSubview(markView)

        UIView.animate(withDuration: 0.33) { [weak self] in
            self?.markView.frame.origin.y = 0
        }
    }
    
    @objc func hidden() {
        
        UIView.animate(withDuration: 0.33, animations: { [weak self] in
            self?.markView.frame.origin.y = screenHeight
        }) { (_) in
            _ = self.markView.subviews.map{ return $0.removeFromSuperview() }
            self.markView.removeFromSuperview()
        }
    }
    
    /// 工具条
    lazy var toolView: XPPickToolBarView = {
        let view = XPPickToolBarView()
        _ = view.initWithCustomerTool()
        return view
    }()
    
    lazy var pickerView:UIPickerView = {
        let view:UIPickerView = UIPickerView.init()
        return UIPickerView()
    }()
    
    lazy var markView: UIView = {
        let view = UIView.init(frame: UIApplication.shared.keyWindow!.bounds)
        view.frame.origin.y = screenHeight
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hidden)))
        return view
    }()
    
}

extension XPPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: 实现UIPickerViewDataSource的方法
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponent != nil ? numberOfComponent!() : 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfRowsInComponent != nil ? numberOfRowsInComponent!(pickerView,component) : 0
    }
    
    // MARK: 实现UIPickerViewDelegate的方法
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickViewCellH
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let lab = UILabel()
        lab.text = textOfSelectRow != nil ? textOfSelectRow!(pickerView,row,component) : ""
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.frame = CGRect(x: 0, y: 0, width: screenWidth, height: pickViewCellH)
        lab.textAlignment = NSTextAlignment.center
        return lab
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.didSelectRow?(pickerView, row, component)
        
        let numberComponent = self.data?.getNumberOfComponent() ?? 0
        switch (numberComponent, component) {
        case (2, 0):
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        case (3, 0):
            pickerView.reloadComponent(1)
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        case (3, 1):
            
            pickerView.reloadComponent(2)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        default: break
        }
    }
}
