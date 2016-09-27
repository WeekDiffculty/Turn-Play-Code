//
//  RootViewController.swift
//  04-tableview表格视图
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView!//表格视图对象
    var dataArr=NSMutableArray()//表格填充的数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        // Do any additional setup after loading the view.
        //数组赋值
        for i in 0 ..< 10 {
            dataArr.addObject(i)
            
        }
        //表格对象 初始化
        tableView=UITableView(frame: CGRectMake(0,0,view.frame.width,view.frame.height),style:.Plain)
        tableView.delegate=self
        tableView.dataSource=self
        self.view.addSubview(tableView)
        
    }
    //MARK: - UITableViewDataSource  
    //MARK == oc 中 #programa mark
    //分区个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //每个分区的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    //设置表格中的单元格
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="cell"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell==nil {
            cell=UITableViewCell(style: .Default,reuseIdentifier: cellIdentifier)
        }
        let data=dataArr[indexPath.row]
        cell?.textLabel?.text="第\(data.stringValue)行"
        return cell!
    }
    //MARK - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("选中 \(indexPath.section) 分区\(indexPath.row)行")
        
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
