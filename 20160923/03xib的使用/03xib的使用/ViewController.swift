//
//  ViewController.swift
//  03xib的使用
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let customView=NSBundle.mainBundle().loadNibNamed("CustomView", owner: nil, options: nil)[0] as! CustomView
        NSLog("\(customView)")
        customView.center=view.center
       view.addSubview(customView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

