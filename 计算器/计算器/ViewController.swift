//
//  ViewController.swift
//  计算器
//
//  Created by 许建辉 on 2018/7/29.
//  Copyright © 2018年 许建辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    var firstOperand:Double = 0.0
    var secondOperand:Double = 0.0
    var decimalPointFlag:Bool = false
    var isSecond:Bool = false
    var operatorFlag:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTap(_ sender: UIButton) {
        if labelResult.text == "0" || (isSecond && secondOperand==0.0){
            labelResult.text = ""
        }
        if let value = sender.titleLabel?.text {
            labelResult.text = labelResult.text! + value
        }
        if isSecond {
            secondOperand = (labelResult.text! as NSString).doubleValue
        }else {
            firstOperand = (labelResult.text! as NSString).doubleValue
        }
    }
    
    @IBAction func operatorTap(_ sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            
            switch sender.titleLabel!.text! {
            case "+":
                operatorFlag = "+"
            case "-":
                operatorFlag = "-"
            case "×":
                operatorFlag = "*"
            case "÷":
                operatorFlag = "/"
            default:
                operatorFlag = ""
            }
        }
    }
    
    @IBAction func decimalPointTap(_ sender: Any) {
        if !decimalPointFlag {
            labelResult.text = labelResult.text!+"."
            if isSecond {
                secondOperand = ( labelResult.text! as NSString ).doubleValue
            }else{
                firstOperand = ( labelResult.text! as NSString ).doubleValue
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        labelResult.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        decimalPointFlag = false
        isSecond = false
        operatorFlag = ""
    }
    
    @IBAction func resultTap(_ sender: Any) {
        if isSecond {
            if operatorFlag == "0" && secondOperand == 0 {
                print("Error: 除数不能为0")
                return
            }
            var result:Double = 0.0
            switch operatorFlag {
            case "+":
                result = firstOperand+secondOperand
            case "-":
                result = firstOperand-secondOperand
            case "*":
                result = firstOperand*secondOperand
            case "/":
                result = firstOperand/secondOperand
            default:
                result=0.0
            }
            labelResult.text = result.description
            print("第一操作数:\(firstOperand)")
            print("操作符:\(operatorFlag)")
            print("第二操作数:\(secondOperand)")
            print("结果:\(result)")
            firstOperand = result
            secondOperand = 0.0
            decimalPointFlag = false
            isSecond = false
            operatorFlag = ""
        }
    }
    
}

