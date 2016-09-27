//
//  SecondViewController.swift
//  01第一个ui
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor=UIColor.orangeColor()
        //创建UIButton
        let myBtn=UIButton(frame:CGRect(x:100,y:400,width: 100,height: 50))
        myBtn.setTitle("关闭", forState: .Normal)
        myBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myBtn.addTarget(self, action: #selector(closeVC), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myBtn)
    }
    func closeVC(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
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
