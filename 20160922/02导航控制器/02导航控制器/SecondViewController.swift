//
//  SecondViewController.swift
//  02导航控制器
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor=UIColor.whiteColor()
        navigationItem.hidesBackButton=true //隐藏导航条的返回按钮
        
        
        title="第二页"
        
        let btn=UIButton(frame:CGRectMake(100,200,100,50))
        
        
        let leftItem=UIBarButtonItem(barButtonSystemItem: .Action,target:self,action: #selector(back))
        navigationItem.leftBarButtonItem=leftItem
        
    }
    func back(){
        navigationController?.popViewControllerAnimated(true)
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
