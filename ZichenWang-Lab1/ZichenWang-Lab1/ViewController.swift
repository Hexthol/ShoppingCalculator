//
//  ViewController.swift
//  ZichenWang-Lab1
//
//  Created by 王梓辰 on 6/10/20.
//  Copyright © 2020 Zichen Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //elements from storyboard
    @IBOutlet weak var price_: UITextField!
    @IBOutlet weak var discount_: UITextField!
    @IBOutlet weak var tax_: UITextField!
    @IBOutlet weak var result_: UILabel!
    @IBOutlet weak var pricewarning_: UILabel!
    @IBOutlet weak var discountwarning_: UILabel!
    @IBOutlet weak var taxwarning_: UILabel!
    @IBOutlet weak var title_: UILabel!
    @IBOutlet weak var optitle_: UILabel!
    @IBOutlet weak var dtitle_: UILabel!
    @IBOutlet weak var stitle_: UILabel!
    @IBOutlet weak var fptitle_: UILabel!
    @IBOutlet weak var rsbutton_: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rsbutton_.setTitle(NSLocalizedString("RS", comment: ""), for: .normal)
        result_.text = NSLocalizedString("unit", comment: "") + "0.00"
        optitle_.text = NSLocalizedString("OP", comment: "")
        dtitle_.text = NSLocalizedString("Dt", comment: "")
        stitle_.text = NSLocalizedString("ST", comment: "")
        fptitle_.text = NSLocalizedString("FP", comment: "")
        pricewarning_.text=" "
        discountwarning_.text=" "
        taxwarning_.text=" "
        title_.text = NSLocalizedString("Title", comment: "title")
    }
    
    //update the result when any text field is edited
    @IBAction func pricechanged(_ sender: Any) {
        updateresult()
    }
    
    @IBAction func discountchanged(_ sender: Any) {
        updateresult()
    }
    
    @IBAction func taxchanged(_ sender: Any) {
        updateresult()
    }
    
    //creative portion: a reset botton that clear text fields and result
    @IBAction func reset(_ sender: Any) {
        result_.text = NSLocalizedString("unit", comment: "") + "0.00"
        pricewarning_.text=" "
        discountwarning_.text=" "
        taxwarning_.text=" "
        price_.text = ""
        discount_.text = ""
        tax_.text = ""
    }
    
    //main logic that computes the final price
    func updateresult(){
        pricewarning_.text=" "
        discountwarning_.text=" "
        taxwarning_.text=" "
        
        let priceinput:String? = price_.text
        let discountinput:String? = discount_.text
        let taxinput:String? = tax_.text

        var pricenum = 0.0
        var discountnum = 0.0
        var taxnum = 0.0
        
        //check if the price input is appropriate
        if priceinput == nil || priceinput! == ""{
            
        }
        else if Double(priceinput!) != nil{
            pricenum = Double(priceinput!)!
        }else{
            pricewarning_.text=NSLocalizedString("WPF", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        if pricenum < 0 {
            pricewarning_.text=NSLocalizedString("NNP", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        
        //check if the discount input is appropriate
        if discountinput == nil || discountinput! == ""{
            
        }
        else if Double(discountinput!) != nil{
            discountnum = Double(discountinput!)!
        }else{
            discountwarning_.text=NSLocalizedString("WDF", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        if discountnum < 0 {
            discountwarning_.text=NSLocalizedString("NND", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        } else if discountnum > 100 {
            discountwarning_.text=NSLocalizedString("ED", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        
        //check if the tax input is appropriate
        if taxinput == nil || taxinput! == ""{
            
        }
        else if Double(taxinput!) != nil{
            taxnum = Double(taxinput!)!
        }else{
            taxwarning_.text=NSLocalizedString("WTF", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        if taxnum < 0 {
            taxwarning_.text=NSLocalizedString("NNT", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        } else if taxnum > 100 {
            taxwarning_.text=NSLocalizedString("ET", comment: "")
            result_.text = NSLocalizedString("unit", comment: "") + "0.00"
            return
        }
        
        
        //calculation of the final price
        let finalPrice: Double = (1-discountnum/100+taxnum/100)*pricenum
        let displayText = NSLocalizedString("unit", comment: "") + "\(String(format: "%.2f", finalPrice))"
        result_.text = displayText
    }
    
}

