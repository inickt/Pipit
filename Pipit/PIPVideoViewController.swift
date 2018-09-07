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
    
    @IBOutlet private var playerView: AVPlayerView!
    @IBOutlet var infoView: NSVisualEffectView!
    @IBOutlet var infoIndicator: NSProgressIndicator!
    @IBOutlet var infoLabel: NSTextField!
    
    private var piping = false
    
    lazy var pip: PIPViewController = {
        let pip = PIPViewController()
        pip.delegate = self
        return pip
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.autoresizingMask = [.width, .height]
        
        self.infoView.layer?.cornerRadius = 10
        self.infoIndicator.startAnimation(nil)
    }
    
    func present() {
        pip.presentAsPicture(inPicture: self)
    }
    
    func play(url: URL, aspectRatio: NSSize?, startTime: CMTime?) {
        
        let player = AVPlayer(url: url)
        self.playerView.player = player
        
        if let aspectRatio = aspectRatio { pip.aspectRatio = aspectRatio }
        if let startTime = startTime { player.seek(to: startTime) }
        pip.playing = true
        
        
        player.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        player.play()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let player = object as? AVPlayer {
            if player.status == .readyToPlay {
                NSAnimationContext.runAnimationGroup({ context in
                    context.duration = 0.5
                    self.infoView.animator().alphaValue = 0.0
                })
            }
        }
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
