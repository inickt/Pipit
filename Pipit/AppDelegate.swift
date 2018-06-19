//
//  AppDelegate.swift
//  Pipit
//
//  Created by Nick Thompson on 6/12/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa
import AVKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        
        self.statusItem.button?.image = #imageLiteral(resourceName: "StatusBarButtonImage")
        self.statusItem.button?.action = #selector(buttonPressed)
        
        let menu = NSMenu()
        
        menu.addItem(withTitle: "About Pipit", action: nil, keyEquivalent: "")
        menu.addItem(withTitle: "Preferences...", action: nil, keyEquivalent: ",")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Enter URL", action: #selector(buttonPressed), keyEquivalent: "o")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit Pipit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        
        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        
        guard urls.count == 1 else { return }
        
        let urlString = urls[0].absoluteString
        
        if urlString.contains("pipit://weblink?url=") {
            
            if let webURL = urlString.replacingOccurrences(of: "pipit://weblink?url=", with: "").removingPercentEncoding {
                if let url = URL(string: webURL) {
                    if let url = VideoManager.getURL(url: url) {
                        let pipVideoVC = PIPVideoViewController.make()
                        pipVideoVC?.play(url: url, aspectRatio: nil)
                    }
                }
            }   
        }
    }
    
    @objc func buttonPressed() {
        let answer = getString(title: "Test", question: "Enter URL", defaultValue: "http://")
        
        print(answer)
        if let startURL = URL(string: answer) {
            if let url = VideoManager.getURL(url: startURL) {
                let pipVideoVC = PIPVideoViewController.make()
                pipVideoVC?.play(url: url, aspectRatio: nil)
            }
        }
    }
    
    func dialogOKCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }

    func getString(title: String, question: String, defaultValue: String) -> String {
        let msg = NSAlert()
        msg.addButton(withTitle: "OK")      // 1st button
        msg.addButton(withTitle: "Cancel")  // 2nd button
        msg.messageText = title
        msg.informativeText = question
//        msg.window.level = .statusBar
        
        let txt = NSTextField(frame: NSRect(x: 0, y: 0, width: 300, height: 24))
        txt.placeholderString = defaultValue
        
        msg.accessoryView = txt
        
        NSApplication.shared.activate(ignoringOtherApps: true)
        let response: NSApplication.ModalResponse = msg.runModal()
        
        if (response == NSApplication.ModalResponse.alertFirstButtonReturn) {
            return txt.stringValue
        } else {
            return ""
        }
    }
}

