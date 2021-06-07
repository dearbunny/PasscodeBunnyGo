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
    
    
    //重設
    func reset() {
        
        for i in 0...3 {
            guessImages[i].isHidden = true
            guessbackImage[i].isHidden = false
        }
        enter = ""
        moodLabel.text = "輸入密碼才能和可愛的我相見"

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
            moodLabel.text = "密碼正確，我來了！"
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
        //輸入錯誤密碼時
        else if enter != correctPasscode{
            let controller = UIAlertController(title: "密碼錯誤", message: "請確認密碼", preferredStyle: .alert)
            moodLabel.text = "密碼錯誤，再見了！"
            let action = UIAlertAction(title: "再次輸入", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    
    /*
    func initialImage() {
        for i in 0...guessImages.count-1 {
            //設定遮罩
            let imageView = UIImageView(image: UIImage(named: "\(guessImageName[i])"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)

            let backImageView = UIImageView(image: UIImage(named: "\(guessBackImageName[i])"))
            backImageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
            //clear guessImage
            guessImages[i].isHidden = true

        }
    }
    
    // 檢查密碼
    func showImage() {
        print("check passcode")

        let passcodeCount = inputPasscodeStr.count

        moodImageView.image = UIImage(named: "mood-1")
        moodLabel.text = "輸入密碼才能和可愛的我相見"

        if guessPasscode == correctPasscode{
            print("CORRECT!")
            let alert = UIAlertController(title: "密碼正確", message: "恭喜！", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default) { (_)
                in
                self.initial()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else{
            let  alert = UIAlertController(title: "密碼錯誤", message: "請確認密碼", preferredStyle: .alert)
            let action = UIAlertAction(title: "再次輸入", style: .default) { (_) in
                self.showImage()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)


        }
    }
    */


}

