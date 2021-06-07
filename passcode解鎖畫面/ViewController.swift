//
//  ViewController.swift
//  passcode解鎖畫面
//
//  Created by ROSE on 2021/6/6.
//

import UIKit

class ViewController: UIViewController {
    
    let correctPasscode = "2020"
    var enter = ""
    
    // 心情圖
    @IBOutlet weak var moodImageView: UIImageView!
    @IBOutlet weak var moodLabel: UILabel!
    
    // 數字鍵
    @IBOutlet var numBtn: [UIButton]!
    
    // 密碼圖
    @IBOutlet var guessImages: [UIImageView]!
    @IBOutlet var guessbackImage: [UIImageView]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    
    
    // 輸入密碼
    @IBAction func enterPasscode(_ sender: UIButton) {
        //密碼長度不等於4
        if enter.count != 4{
            if let inputNumber = sender.currentTitle{
                //字串相加
                enter.append(inputNumber)
            }
        }
        showImage()
    }
    
    // 清除密碼
    @IBAction func deletePasscode(_ sender: UIButton) {
        // 刪除最後一個字
        if enter.count != 0{
            enter.removeLast()
        }
        showImage()
    }
    
    // 重設按鈕
    @IBAction func resetPasscode(_ sender: UIButton) {
        reset()
    }
    
    
    // 重設
    func reset() {
        for i in 0...3 {
            guessImages[i].isHidden = true
            guessbackImage[i].isHidden = false
        }
        enter = ""
        moodLabel.text = "輸入密碼才能和可愛的我相見"
        moodImageView.image = UIImage(named: "mood-1")
    }
    
    
    // 顯示圖片
    func showImage() {
        //輸入第1~4個數字要做的動作
        switch enter.count {
        case 1:
            guessImages[0].isHidden = false
            guessbackImage[0].isHidden = true
            for i in 1...3{
                guessImages[i].isHidden = true
                guessbackImage[i].isHidden = false
            }
        case 2:
            for i in 0...3{
                if i > 1{
                    // 1以上的隱藏
                    guessImages[i].isHidden = true
                    guessbackImage[i].isHidden = false
                    //print(guessImages[i])
                } else {
                    guessImages[i].isHidden = false
                    guessbackImage[i].isHidden = true
                }
            }
        case 3:
            for i  in 0...2 {
                guessImages[i].isHidden = false
                guessbackImage[i].isHidden = true
            }
            guessImages[3].isHidden = true
            guessbackImage[3].isHidden = false
        case 4:
            for i in 0...3 {
                guessImages[i].isHidden = false
                guessbackImage[i].isHidden = true
            }
            // 檢查密碼是否正確
            checkPasscode()
            
        default:
            reset()
        }
    }
    
    // 檢查密碼是否正確
    func checkPasscode() {
        //輸入正確密碼時
        if enter == correctPasscode{
            let controller = UIAlertController(title: "密碼正確", message: "恭喜！", preferredStyle: .alert)
            moodLabel.text = "密碼正確，接受我的飛撲吧！"
            moodImageView.image = UIImage(named: "mood-right")
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
        //輸入錯誤密碼時
        else if enter != correctPasscode{
            let controller = UIAlertController(title: "密碼錯誤", message: "請確認密碼", preferredStyle: .alert)
            //密碼錯誤 圖文"
            wrongMessage()
            worngImage()
            
            let action = UIAlertAction(title: "再次輸入", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
    }
    
    // 輸入錯誤文字訊息
    func worngImage() {
        let moodArray = ["mood-2","mood-3","mood-4","mood-5","mood-6"]
        let wornRandomImage = moodArray.randomElement()!
        moodImageView.image = UIImage(named: wornRandomImage)
    }
    func wrongMessage() {
        let worngLabel = ["你不愛我了...","吼呦～吼呦～我不管","我好難過...","再這樣，我們只好說再見了...","你是不是不想見到我..."]
        let wornRandomText = worngLabel.randomElement()!
        moodLabel.text = wornRandomText
    }
}

