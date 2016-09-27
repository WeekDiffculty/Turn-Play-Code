//
//  FirstViewController.swift
//  01第一个ui
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
//用let代替oc 中的宏定义
let lbl_Tag=1001
class FirstViewController: UIViewController {
    
    var count:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //设置背景颜色
        self.view.backgroundColor=UIColor.whiteColor()
        //1.标签视图UILabel
        let rect=CGRect(x:100,y:100,width: 100,height: 100)
        let lBl=UILabel(frame:rect)
        lBl.text="青云教育"
       lBl.backgroundColor=UIColor.orangeColor()
       lBl.textColor=UIColor.whiteColor()
        lBl.textAlignment=NSTextAlignment.Center
        lBl.tag=lbl_Tag //tag值 必须是唯一的值,否则会出现莫名奇妙的错误,不容易发现
        self.view.addSubview(lBl)
        
        //2.创建UIbutton
        let myBtn=UIButton(frame:CGRectMake(100,200,100,50))
        myBtn.setTitle("按钮", forState:UIControlState.Normal)
        myBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myBtn.addTarget(self, action: #selector(clickMe), forControlEvents: .TouchUpInside)
        self.view.addSubview(myBtn)
        
        
        
        let myBtn1=UIButton(frame:CGRect(x:100,y:400,width: 100,height: 50))
        myBtn1.setTitle("打开视图控制器2", forState: .Normal)
        myBtn1.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        myBtn1.addTarget(self, action: #selector(openVC), forControlEvents: .TouchUpInside)
        self.view.addSubview(myBtn1)
        
        
    }
    //按钮事件响应方法
    func clickMe(sender:UIButton){
        print("clickMe")
        count+=1;
        //获取UILabel对象
        //as! 表示类型强制转换
        let lbl=self.view.viewWithTag(lbl_Tag) as! UILabel
        lbl.text=String(count)
        alertView()
    }
    func alertView(){
        //定义对话框对象
        let alert=UIAlertController(title: "标题",message: "消息",preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "取消",style: UIAlertActionStyle.Default,handler: {
            (UIAlertAction) in
            print("取消")
        }))
        alert.addAction(UIAlertAction(title: "确定",style: UIAlertActionStyle.Default,handler: {
            (UIAlertAction) in
            print("确定")
        }))
        //弹出对话框视图
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //打开视图控制器事件响应方法
    func openVC(sender:UIButton){
        let sVC=SecondViewController()
        self.presentViewController(sVC, animated: true, completion: nil)
        
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
