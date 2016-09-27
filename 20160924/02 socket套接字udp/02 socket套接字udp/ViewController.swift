//
//  ViewController.swift
//  02 socket套接字udp
//
//  Created by qingyun on 16/9/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
class ViewController: UIViewController ,GCDAsyncUdpSocketDelegate{
    @IBOutlet weak var ipTf: UITextField!

    @IBOutlet weak var portTf: UITextField!
    
    @IBOutlet weak var contentTF: UITextField!
    
    @IBOutlet weak var receiveTV: UITextView!
    //GCDAsyncSocket tcp的套接字
    //GCDAsyncUdpSocket udp的套接字
    var udpSocket:GCDAsyncUdpSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        udpSocket=GCDAsyncUdpSocket(delegate: self, delegateQueue:dispatch_get_main_queue())
    }
    //发送数据
    @IBAction func sendBtn(sender: UIButton) {
        
        let ip=ipTf.text
        let port=UInt16(portTf.text!)
        let data=contentTF.text?.dataUsingEncoding(NSUTF8StringEncoding)
        
        udpSocket.sendData(data!, toHost: ip!
            , port: port!, withTimeout: -1, tag: 1)
        do{
            //开始接收从服务器发来的数据
           try udpSocket.beginReceiving()
        }catch {
            print(error)
        }
        
    }
    func showMsg(str:String){
        receiveTV.text = "\n\(str)"
    }
    @IBAction func clearBtn(sender: UIButton) {
        receiveTV.text = ""
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int){
        print("向服务器发送数据成功!")
    }
    func udpSocket(sock: GCDAsyncUdpSocket, didReceiveData data: NSData, fromAddress address: NSData, withFilterContext filterContext: AnyObject?) {
        print("从服务器接收数据")
        
        let str=String(data: data,encoding: NSUTF8StringEncoding)
        if str != nil {
            self.showMsg(str!)
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

