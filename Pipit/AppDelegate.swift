//
//  AppDelegate.swift
//  Pipit
//
//  Created by Nick Thompson on 6/12/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        print(urls)
    }

}

