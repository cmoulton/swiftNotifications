//
//  AppDelegate.swift
//
//  Created by Christina Moulton on 2015-04-29.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  // create QuoteUpdater to start timer
  //var quoteUpdater = QuoteUpdater()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    let URL =  NSURL(string: "https://mashape-community-urban-dictionary.p.mashape.com/define?term=hipster")
    println("URL = \(URL)")
    var mutableUrlRequest = NSMutableURLRequest(URL: URL!)
    mutableUrlRequest.HTTPMethod = Alamofire.Method.GET.rawValue
    //mutableUrlRequest.setValue("application/json",forHTTPHeaderField:"Accept")
    
    let manager = Alamofire.Manager.sharedInstance
    manager.session.configuration.HTTPAdditionalHeaders = ["X-Mashape-Key": "vpYezSWaLCmshZlFLJIurcitJRL6p1V37FpjsnjuCpKDezJHGe"]
    let request = manager.request(mutableUrlRequest).responseJSON { (request, response, json, error) -> Void in
      if (error != nil){
        println("JSON Error \(error!.localizedDescription)")
      }
      else {
        println(response)
        println(json)
        if let jsonResult = json as? Dictionary<String,AnyObject>
        {
          println(jsonResult)
        }
      }
    }
    

    return true
  }

}

