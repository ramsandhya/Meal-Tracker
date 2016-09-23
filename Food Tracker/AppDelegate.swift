//
//  AppDelegate.swift
//  Food Tracker
//
//  Created by Jitendra Ram on 9/2/16.
//  Copyright © 2016 Sandhya Ram. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

// NOTES:
// This app is fully Swift 3 compatible. The developer.apple still has Swift 2 Implementation.
/*
 @UIApplicationMain is the attribute with following responsibilities :
 1. Creates UIApplication object- It takes care of the whole lifecycle of the app
 2. Creates UIAppDelegate object- It creates a window property to where the app's content is drawn. ALso, takes care of the state transitions within the app.
 AppDelegate class is blueprint of AppDelegate object instance.
 AppDelegate class has a single UIWIndow property which is optional and it can have no value at some point i.e. nil value.
 
 AppDelegate class contains some predefined methods(I call it native methods) which lets applicaton object talk to the delegate object.
 
 
 */









