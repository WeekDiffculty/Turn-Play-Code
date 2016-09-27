//
//  ViewController.swift
//  06故事板storyboard中的表格视图
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView:UITableView!
    var dataArr=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0 ..< 10 {
            dataArr.append("第\(i)行")
        }
        //注:在storyboard 使用cell,不需要在代码中注册registerCell
        tableView.delegate=self
        tableView.dataSource=self
        
    }
    //MARK:- UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section)分区"
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId:String
        if indexPath.row % 2 == 0 {
            cellId = "Cell"
        }else{
            cellId = "Cell1"
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId,forIndexPath:indexPath)
        
        if indexPath.row % 2 == 0 {
            let cell1 = cell as! CustomCell
            let strInfo="\(dataArr[indexPath.row])"+"我是CustomCell"
            cell1 .updateCell(strInfo)
            return cell1
        }else{
            let cell2 = cell as! CustomCell1
            let strInfo="\(dataArr[indexPath.row])"+"我是CustomCell1"
            
            cell2.updateCell(strInfo)
            return cell2
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

