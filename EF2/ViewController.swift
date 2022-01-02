//
//  ViewController.swift
//  EF2
//
//  Created by Matsui Keiji on 2018/01/29.
//  Copyright © 2018年 Matsui Keiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet var LVDdPicker:UIPickerView!
    @IBOutlet var LVDsPicker:UIPickerView!
    @IBOutlet var EFLabel:UILabel!
    
    var vLVDd = 50.0
    var vLVDs = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    @objc func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return 99
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        let c = "\(row + 1)"
        return c
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            vLVDd = Double(row + 1)
        }
        if pickerView.tag == 1{
            vLVDs = Double(row + 1)
        }
        if vLVDs >= vLVDd{
            EFLabel.text = "EF: ___%"
        }
        else{
            let vEDV = 7.0 * pow(vLVDd,3.0) / (vLVDd + 2.4)
            let vESV = 7.0 * pow(vLVDs,3.0) / (vLVDs + 2.4)
            let vEF = Int(round((vEDV - vESV) * 100.0 / vEDV))
            EFLabel.text = "EF: " + String(vEF) + "%"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LVDdPicker.selectRow(49, inComponent: 0, animated: true)
        LVDsPicker.selectRow(29, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
