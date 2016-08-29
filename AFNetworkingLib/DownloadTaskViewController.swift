//
//  DownloadTaskViewController.swift
//  AFNetworkingLib
//
//  Created by MacSong on 16/8/29.
//  Copyright © 2016年 MacSong. All rights reserved.
//

import UIKit

class DownloadTaskViewController: UIViewController {
    
    let sourceUrl:String = "http://www.bing.com/az/hprichbg/rb/Markthal_ZH-CN11336253538_1366x768.jpg"
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var pathLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let manager:AFURLSessionManager = AFURLSessionManager(sessionConfiguration: configuration)
        
        if let url = NSURL(string: self.sourceUrl){
            let request:NSURLRequest = NSURLRequest(URL: url)
            
            let downloadTask = manager.downloadTaskWithRequest(request, progress: { (progress) in
                self.progressLabel.text = "\(progress.fractionCompleted)% completed."
                }, destination: { (u, response) -> NSURL in
                    let documentUrl:NSURL? = try? NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.PicturesDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
                    
                    return documentUrl!.URLByAppendingPathComponent(response.suggestedFilename!)
                }, completionHandler: { (response, url, error) in
                    self.pathLabel.text = "存储路径：\(url?.absoluteString)"
            })
            
            downloadTask.resume()
        }
        
        
        
        
        
        
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
