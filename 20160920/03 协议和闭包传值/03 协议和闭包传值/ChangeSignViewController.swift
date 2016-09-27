//
//  ChangeSignViewController.swift
//  03 协议和闭包传值
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class ChangeSignViewController: UIViewController {
    @IBOutlet weak var signTf:UITextField!
    var signString:String?
    var delegate:ChangeSignProtocol?
    var changeSignValue:((String)->())?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signTf.text=signString
    }
    
    @IBAction func done(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: {
            [unowned self]() -> Void in
            //协议{传值[
            //self.delegate!.changeValue(self.signTf.text!)
            if self.changeSignValue != nil {
                //闭包传值
                self.changeSignValue!(self.signTf.text!)
            }
        })
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
