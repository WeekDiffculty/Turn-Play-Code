//
//  FirstViewController.swift
//  02导航控制器
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    view.backgroundColor=UIColor.orangeColor()
        navigationItem.title="首页"
        
        let nextItem=UIBarButtonItem(title: "下一页",style: .Plain,target: self,action: #selector(newPage))
        navigationItem.rightBarButtonItem=nextItem
        
    }
    func newPage(){
       let secondVC=SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
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
