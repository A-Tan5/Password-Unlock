//
//  ViewController.swift
//  Password Unlock
//
//  Created by tantsunsin on 2020/7/24.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    var PassWordTyped = ""

    @IBOutlet weak var FirstPassword: UIImageView!
    @IBOutlet weak var SecondPassword: UIImageView!
    @IBOutlet weak var ThirdPassword: UIImageView!
    @IBOutlet weak var FourthPassword: UIImageView!
    
    
    // 打入1~0密碼
    @IBAction func typeinpassword(_ sender: UIButton) {
        if let Inputtext = sender.titleLabel?.text,
        PassWordTyped.count < 4{
            PassWordTyped.append(Inputtext)
            print(PassWordTyped)
            ShowPasswordCount()
        }
    }
    
    
    // 按刪除鍵
    @IBAction func deletepassword(_ sender: UIButton) {
        if PassWordTyped.count >= 1 {
            PassWordTyped = String(PassWordTyped.dropLast(1))
            print(PassWordTyped)
            ShowPasswordCount()
        }
    }
    
    // 四格密碼顯示的調整
    func ShowPasswordCount(){
        if PassWordTyped.count == 0{
            FirstPassword.isHighlighted = false
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        }else if PassWordTyped.count == 1{
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = false
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        }else if PassWordTyped.count == 2{
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = false
            FourthPassword.isHighlighted = false
        }else if PassWordTyped.count == 3{
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = true
            FourthPassword.isHighlighted = false
        }else if PassWordTyped.count == 4{
            FirstPassword.isHighlighted = true
            SecondPassword.isHighlighted = true
            ThirdPassword.isHighlighted = true
            FourthPassword.isHighlighted = true
            CorrectorWrong()
        }
    }
    
    // 把所有打過的密碼，跟四格密碼顯示，都刪掉
    func ClearPassword(){
        FirstPassword.isHighlighted = false
        SecondPassword.isHighlighted = false
        ThirdPassword.isHighlighted = false
        FourthPassword.isHighlighted = false
        PassWordTyped = ""
    }
    
    // 打入四個密碼後，檢查是否是對的，假設正確密碼是0258
    func CorrectorWrong (){
        if PassWordTyped == "0258"{
            let alert = UIAlertController(title: "Correct!", message: "Good Job!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: ClearPassword)
        }else{
            let alert = UIAlertController(title: "Wrong!", message: "Give it another try!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: ClearPassword)
         }
        
        
    }
    
    

    
    
    
    
    
    
}

