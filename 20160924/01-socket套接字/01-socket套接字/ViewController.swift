//
//  ViewController.swift
//  01-socket套接字
//
//  Created by qingyun on 16/9/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
//心跳包
let longConnectHearBeat = "heartbeat"
class ViewController: UIViewController ,GCDAsyncSocketDelegate{

    @IBOutlet weak var ipTf: UITextField!
    
    @IBOutlet weak var portTf: UITextField!
    
    @IBOutlet weak var connectBtn: UIButton!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var contentTF: UITextField!
    
    
    @IBOutlet weak var receiveMsgTV: UITextView!
    
    var asyncSocket:GCDAsyncSocket! //套接字对象
    var timer:NSTimer?
    
    
    @IBOutlet weak var clearBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初始化套接字
        asyncSocket=GCDAsyncSocket(delegate: self,delegateQueue:dispatch_get_main_queue())
        
    }
    
  
    //连接
    @IBAction func connectBtn(sender: AnyObject) {
        let ip=ipTf.text
        let nport=UInt16(portTf.text!)
        print("\(ip) \(nport)")
        let btn:UIButton = sender as! UIButton
        if btn.titleLabel?.text == "连接" {
            do{
                //连接到服务器
                try  asyncSocket.connectToHost(ip!, onPort: nport!)
            }catch{
                print("连接错误\(error)")
            }
        }else{
            //断开连接
            asyncSocket.disconnect()
        }
        
        
    }
    //发送心跳包
    func sendHeartBeatData(){
        let data =  longConnectHearBeat.dataUsingEncoding(NSUTF8StringEncoding)
        //向服务器发消息/数据
        //-1 表示无超时
        asyncSocket.writeData(data!, withTimeout: -1, tag: 1)
        
    }
    func showMsg(str:String){
        receiveMsgTV.text!+="\n\(str)"
    }
    //发送消息的按钮
    @IBAction func sendBtn(sender: AnyObject) {
        
        let data=contentTF.text?.dataUsingEncoding(NSUTF8StringEncoding)
        //发送消息
        asyncSocket.writeData(data!, withTimeout: -1, tag: -1)
        
    }
    
    //清空按钮
    @IBAction func clearBtn(sender: AnyObject) {
        
        receiveMsgTV.text=""
    }
    
    
    //MARK:GCDAsyncSocketDelegate
    func socket(sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("连接到主机成功")
        connectBtn.setTitle("断开", forState: .Normal)
        
        //心跳包
        timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(sendHeartBeatData), userInfo: nil, repeats: true)
        //主动接收消息
        asyncSocket.readDataWithTimeout(-1, tag: -1)
        
    }
    //发送数据
    //tag 作用 是区分套接字
    func socket(sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        print("向服务器发送数据成功")
        
    }
    func socket(sock: GCDAsyncSocket, didReadData data: NSData, withTag tag: Int) {
        print("收到服务器的消息")
        let str=String(data:data,encoding: NSUTF8StringEncoding)
        self.showMsg(str!)
        //等待套接字读取数据
        asyncSocket.readDataWithTimeout(-1, tag: 1)
    }
    func socketDidDisconnect(sock: GCDAsyncSocket, withError err: NSError?) {
        print("断开连接 \(err)")
        connectBtn.setTitle("连接", forState: .Normal)
        //计时器暂停 不发心跳包
        timer?.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

