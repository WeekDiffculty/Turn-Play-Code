//
//  RootTableViewController.swift
//  05 UITableViewController表格视图控制器
//
//  Created by qingyun on 16/9/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    var dataArr=NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        for i in 0 ..< 10 {
            dataArr.addObject(i)
        }
        
        //注册单元格
        //OC [类名 class] == swift 类名.self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let rightItem=UIBarButtonItem(title: "编辑",style: .Plain,target: self,action: #selector(edit))
        //导航条添加按钮
        navigationItem.rightBarButtonItem=rightItem;
        
    }
    //编辑按钮事件响应方法
    func edit(barBtnItem:UIBarButtonItem){
        if barBtnItem.title=="编辑" {
            barBtnItem.title="完成"
            tableView.setEditing(true, animated: true)
        }else{
            barBtnItem.title="编辑"
            tableView.setEditing(false, animated: true)
        }
    }
    //设置分区的行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArr.count
    }
    //设置分区数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return 1
   }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分区:\(section)"
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("cell")
        let strInfo:String=String(dataArr[indexPath.row])
        cell?.textLabel?.text="分区\(indexPath.section)   "+strInfo
        cell?.backgroundColor=UIColor.orangeColor()
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle{
        if indexPath.row%2==0 {
            return .Insert
        }else{
            return .Delete
        }
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //删除
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataArr.removeObjectAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //添加
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            dataArr.insertObject("新增行", atIndex: indexPath.row)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .None)
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
