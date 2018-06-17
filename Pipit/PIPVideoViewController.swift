//
//  PIPVideoViewController.swift
//  Pipit
//
//  Created by Nick Thompson on 6/12/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa
import AVKit

class PIPVideoViewController: NSViewController {

    @IBOutlet weak var player: AVPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
    }
    
}
