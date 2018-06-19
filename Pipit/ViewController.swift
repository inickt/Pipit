//
//  ViewController.swift
//  Pipit
//
//  Created by Nick Thompson on 6/25/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa
import AVKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        let pip = PIPViewController()
        
        
//
//        let vc = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "PIPVideoViewController")) as! PIPVideoViewController
        
        let strurl = "https://www.twitch.tv/adren_tv"
//
//        let realurl = URL(string: url)!
//
//        self.player.player = AVPlayer(url: realurl)
//
//        self.player.player?.play()
        
//        if let url = URL(string: VideoManager.execCommand(args: ["-f", "mp4", "-g", strurl]))
//        {
////            self.player.player = AVPlayer(url: url)
////
////            self.player.player?.play()
//            pip.presentAsPicture(inPicture: self)
//        }
    }
}

