//
//  LoggedOutViewController.swift
//  Pronto
//
//  Created by Deval Parikh on 1/16/19.
//  Copyright © 2019 Steve Sahayadarlin. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class LoggedOutViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "bgvid", ofType: "mov")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidPlayToEnd), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
        
        
    }
    
    @objc func videoDidPlayToEnd(notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: CMTime.zero)
        
    }
}
