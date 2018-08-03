//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 冨田大介 on 2018/07/28.
//  Copyright © 2018年 dai916. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var susumuButton: UIButton!
    @IBOutlet weak var modoruButton: UIButton!
    @IBOutlet weak var saiseiteishiButton: UIButton!
    var timer : Timer!
    var dispImageNo = 0
    
    let imageNameArray = [
        "kisenosato",
        "takanohana",
        "mitakeumi"]
    
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: imageNameArray[dispImageNo])
        slideImage.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のViewControllerKakudaiを取得する
        let viewControllerKakudai:ViewControllerKakudai = segue.destination as! ViewControllerKakudai
        // 遷移先のViewControllerKakudaiで宣言しているimageKakudaiに値を代入して渡す
        viewControllerKakudai.imageName = imageNameArray[dispImageNo]
        //タイマー停止
        if self.timer != nil {
        self.timer.invalidate()
        self.timer = nil
        //戻る・進むボタン　タップ有効
        susumuButton.isEnabled = true
        modoruButton.isEnabled = true
        // 再生ボタン名　切り替え
        saiseiteishiButton.setTitle("再生", for:UIControlState.normal)
        }
    }
    
    func displayImage() {
        //        画像の番号が正常な範囲を示しているかチェック
        //        範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = imageNameArray.count - 1
        }
        //範囲より上をさしている場合、最初の画像を表示
        if dispImageNo > imageNameArray.count - 1 {
            dispImageNo = 0
        }
        //        表示している画像の番号から名前を取り出し、
        let name = imageNameArray[dispImageNo]
        //        画像を読み込み
        let image = UIImage(named: name)
        //        slideImageに読み込んだ画像をセット
        slideImage.image = image
        
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @IBAction func susumu(_ sender: Any) {
        //        表示している画像の番号を１増やす。
        dispImageNo += 1
        //        表示している画像の番号を参考にして画像を表示する。
        displayImage()
    }
    @IBAction func modoru(_ sender: Any) {
        //        表示している画像の番号を１減らす。
        dispImageNo -= 1
        //        表示している画像の番号を参考にして画像を表示する。
        displayImage()
    }
    
    @IBAction func saiseiteishi(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //戻る・進むボタン　タップ不可
            susumuButton.isEnabled = false
            modoruButton.isEnabled = false
            // 停止ボタン名　切り替え
            saiseiteishiButton.setTitle("停止", for:UIControlState.normal)
        } else {
            //タイマー停止
            self.timer.invalidate()
            self.timer = nil
            //戻る・進むボタン　タップ有効
            susumuButton.isEnabled = true
            modoruButton.isEnabled = true
            // 再生ボタン名　切り替え
            saiseiteishiButton.setTitle("再生", for:UIControlState.normal)
        }
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    @objc func updateTimer(_ timer: Timer) {
        //        表示している画像の番号を１減らす。
        dispImageNo += 1
        //        表示している画像の番号を参考にして画像を表示する。
        displayImage()
        
    }
}
