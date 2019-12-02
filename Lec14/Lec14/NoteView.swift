//
//  NoteView.swift
//  Lec14
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable
class NoteView: UIView {

    private var player:AVAudioPlayer?
    
    @IBInspectable var note:String = "c1"
    
    private func initPlayer(){
        let bundle = Bundle(for: NoteView.self)
        guard let url = bundle.url(forResource: note, withExtension: "mp3") else {return}
        
        player = try? AVAudioPlayer(contentsOf: url)
    }

    public func play(){
        if player == nil{
            initPlayer()
        }
        
        player?.play()
    }
}
