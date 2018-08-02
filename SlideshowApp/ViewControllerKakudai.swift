//
//  ViewControllerKakudai.swift
//  SlideshowApp
//
//  Created by 冨田大介 on 2018/08/01.
//  Copyright © 2018年 dai916. All rights reserved.
//
import UIKit
class ViewControllerKakudai: UIViewController {
    var imageName:String = ""
    var imageNameArray = ""
    var dispImageNo = ""
    
    @IBOutlet weak var kakudaigazou: UIImageView!
    @IBAction func modoru(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: imageName)
        kakudaigazou.image = image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
