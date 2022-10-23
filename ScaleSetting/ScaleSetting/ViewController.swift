//
//  ViewController.swift
//  ScaleSetting
//
//  Created by Wei Chu on 2022/7/24.
//

import UIKit

class ViewController: UIViewController {

    //數字欄label
    @IBOutlet weak var numberLabel: UILabel!
    //
    
    //運算變數紀錄
    var operation = "none"
    var performingMath = false
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //讓狀態列顯示為白色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    //
    
    //連結各個數字
    @IBAction func inputNumbers(_ sender: UIButton) {
        
        let inputNumber = sender.tag - 1
             
             if numberLabel.text != nil{
                 if numberLabel.text == "0"{
                     numberLabel.text = "\(inputNumber)"
                 }else{
                     numberLabel.text = numberLabel.text! + "\(inputNumber)"
                 }
                 if performingMath {
                     numberLabel.text!.removeFirst()
                     
                     numberOnScreen = Double(numberLabel.text!) ?? 0
                 }else{
                     numberOnScreen = Double(numberLabel.text!) ?? 0
                 }
             }
        
    }
    //
    
    //按Ｃ清空數字欄
    @IBAction func clearNumber(_ sender: UIButton) {
        
        operation = "none"
        performingMath = false
        numberOnScreen = 0
        previousNumber = 0
        
        numberLabel.text = "0"
        
        
    }
    //
    
    //
    func makeOKNumberString(from number:Double){
        if floor(number) == number{
            numberLabel.text = "\(Int(number))"
        }else{
            numberLabel.text = "\(number)"
        }
    }
    
    
    //
    
    //+-*/運算
    @IBAction func add(_ sender: UIButton) {
        numberLabel.text = "+"
        operation = "add"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func minus(_ sender: UIButton) {
        numberLabel.text = "-"
        operation = "minus"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        numberLabel.text = "x"
        operation = "multiply"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        numberLabel.text = "/"
        operation = "divide"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func giveMeAnwser(_ sender: UIButton) {
        if performingMath == true{
            if operation == "add"{
                numberOnScreen = previousNumber + numberOnScreen
                makeOKNumberString(from: numberOnScreen)
                
            }else if operation == "minus"{
                numberOnScreen = previousNumber - numberOnScreen
                makeOKNumberString(from: numberOnScreen)
                
            }else if operation == "multiply"{
                numberOnScreen = previousNumber * numberOnScreen
                makeOKNumberString(from: numberOnScreen)
                
            }else if operation == "divide"{
                numberOnScreen = previousNumber / numberOnScreen
                makeOKNumberString(from: numberOnScreen)
                
            }else if operation == "none"{
                numberLabel.text = "0"
            }
            performingMath = false
        }
    }
    //
    
}

