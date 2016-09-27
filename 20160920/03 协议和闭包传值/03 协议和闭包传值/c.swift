//
//  UserViewController.swift
//  03 协议和闭包传值
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,ChangeSignProtocol {
    @IBOutlet weak var signLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func changeSignBtn(sender:UIButton){
        let sb=UIStoryboard(name:"Main",bundle: nil)
        let changeVC=sb.instantiateViewControllerWithIdentifier("ChangeSignVC") as! ChangeSignViewController
        changeVC.signString=signLabel.text
        changeVC.delegate=self
        changeVC.changeSignValue={
            //闭包传值
            self.signLabel.text=$0
        }
         self.presentViewController(changeVC,animated:true,completion:nil)
        
    }
//    func changeSignValue(signString:String){
//        print("闭包方法")
//        signLabel.text=signString;
//    }
    //协议的方法实现
    func changeValue(signString:String){
        print("协议中的方法")
        signLabel.text=signString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
