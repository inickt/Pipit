//
//  PIPVideoViewController.swift
//  Pipit
//
//  Created by Nick Thompson on 6/18/18.
//  Copyright © 2018 Nick Thompson. All rights reserved.
//

import Cocoa
import AVKit

class PIPVideoViewController: NSViewController, PIPViewControllerDelegate {

    static func make() -> PIPVideoViewController? {
        return NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "PIPVideo")) as? PIPVideoViewController
    }
    
    @IBOutlet private weak var playerView: AVPlayerView!
    private var piping = false
    
    lazy var pip: PIPViewController = {
        let pip = PIPViewController()
        pip.delegate = self
        return pip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.autoresizingMask = [.width, .height]
    }
    
    func play(url: URL, aspectRatio: NSSize?) {
        pip.presentAsPicture(inPicture: self)
        
        let player = AVPlayer(url: url)
        self.playerView.player = player
        
        if let aspectRatio = aspectRatio { pip.aspectRatio = aspectRatio }
        pip.playing = true
        player.play()
    }
    
    // MARK: - PIPViewControllerDelegate
    
    func pipActionPlay(_ pip: PIPViewController) {
        print("PIP play")
        self.playerView.player?.play()
    }
    
    func pipActionPause(_ pip: PIPViewController) {
        print("PIP pause")
        self.playerView.player?.pause()
    }
    
    func pipActionStop(_ pip: PIPViewController) {
        print("PIP stop")
    }
    
    func pipDidClose(_ pip: PIPViewController) {
        self.pip.dismissViewController(self)
        print("PIP did close")
    }
    
    func pipShouldClose(_ pip: PIPViewController) -> Bool {
        return true
    }
}
