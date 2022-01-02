//
//  InterfaceController.swift
//  EF2 WatchKit Extension
//
//  Created by Matsui Keiji on 2018/01/29.
//  Copyright © 2018年 Matsui Keiji. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var LVDdPicker:WKInterfacePicker!
    @IBOutlet weak var LVDsPicker:WKInterfacePicker!
    @IBOutlet weak var EFLabel:WKInterfaceLabel!
    
    var vLVDd = 50.0
    var vLVDs = 30.0

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var LVDdPickerItems:[WKPickerItem] = []
        var LVDsPickerItems:[WKPickerItem] = []
        for i in 1 ... 99{
            let item = WKPickerItem()
            item.title = String(i)
            LVDdPickerItems.append(item)
            LVDsPickerItems.append(item)
        }
        self.LVDdPicker.setItems(LVDdPickerItems)
        LVDdPicker.setSelectedItemIndex(49)
        self.LVDsPicker.setItems(LVDsPickerItems)
        LVDsPicker.setSelectedItemIndex(29)
        // Configure interface objects here.
    }
    
    func myCalc(){
        if vLVDs >= vLVDd{
            EFLabel.setText("EF: __%")
        }
        else{
            let vEDV = 7.0 * pow(vLVDd,3.0) / (vLVDd + 2.4)
            let vESV = 7.0 * pow(vLVDs,3.0) / (vLVDs + 2.4)
            let vEF = Int(round((vEDV - vESV) * 100.0 / vEDV))
            EFLabel.setText("EF: " + String(vEF) + "%")
        }
    }
    
    @IBAction func LVDdPickerChanged(_ value: Int){
        vLVDd = Double(value + 1)
        myCalc()
    }
    
    @IBAction func LVDsPickerChanged(_ value: Int){
        vLVDs = Double(value + 1)
        myCalc()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
