//
//  ViewController.swift
//  04网络
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
//宏定义
let url="http://news-at.zhihu.com/api/4/news/latest"
let download_url="http://img.hb.aicdn.com/62211cf8b3260ed72213345fe04e568a582a90f5185cc-sz1kEd_fw580"
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      self.requestServer_Get()
      //  self.downloadFile()
        //self.donwloadFile2()
       // downloadFileWithProgress()
        
    }
    func requestServer_Get(){
        Alamofire.request(.GET, url).responseString{
            (response) in
            switch(response.result){
            case .Success(let value):
                print("网络请求成功")
                //print("\(value)")
                //转换数据模型
                let newModel=Mapper<NewsModel>().map(value)
                
                print("news date \(newModel!.date)")
                print("stories 元素个数 \(newModel?.stories.count)")
                //从数组获取每个元素
                for story in (newModel?.stories)!{
                    print("id =\(story.id) date=\(newModel!.date) title=\(story.title)")
                    
                
                }
                
                
            case .Failure(let err):
                print("网络请求失败 \(err.description))")
            }
        }
    }
    //方式1.下载文件
    func downloadFile(){
        Alamofire.download(.GET,download_url){
            (temporaryUrl,response)->NSURL in
            //返回文件保存的路径
            let fileManager=NSFileManager.defaultManager()
            
            let directoryUrl=fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
            let pathComponent = response.suggestedFilename
            print(pathComponent)
            print(directoryUrl?.URLByAppendingPathComponent(pathComponent!))
            
            return (directoryUrl?.URLByAppendingPathComponent(pathComponent!))!
        }
    
    }
    //方式2.自定义存储的目录
    func donwloadFile2(){
        Alamofire.download(.GET,download_url){
            (temporaryUrl,response)->NSURL in
            let fileManager=NSFileManager.defaultManager()
            let directoryUrl=fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first //获取沙盒document目录
            //判断子目录是否存在
            
            let folder=directoryUrl?.URLByAppendingPathComponent("image",isDirectory: true)
            let isFolder=fileManager.fileExistsAtPath(folder!.path!)
            if !isFolder{
                //创建目录
              try!  fileManager.createDirectoryAtURL(folder!, withIntermediateDirectories: true, attributes: nil)
                print("新建目录")
            }
            print(folder)
            
            return (folder?.URLByAppendingPathComponent(response.suggestedFilename!))!
            
        }
    }
    
    //下载进度
    func downloadFileWithProgress(){
        let destination=Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
        let downloadRequest:Request = Alamofire.download(.GET,download_url,destination:destination).progress{//正在下载时
            (bytesRead,totalBytesRead,totalBytesExpectedToRead) in
            let percent=totalBytesRead*100/totalBytesExpectedToRead
            print("已下载:\(totalBytesRead) 当前进度:\(percent)%")
            
            }.response{ //下载结束
                (request,response,_,error) in
                print(response)
                
        }
        //取消下载
        downloadRequest.cancel()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

