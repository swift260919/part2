//
//  PianoView.swift
//  Lec14
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class PianoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        
    }
    
    //layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }

    func layout(){
        subviews.forEach{$0.removeFromSuperview()}
        //for add noteView originX++
        var originX:CGFloat = 0
        let numberOfNotes = 14
        let noteWidth:CGFloat = bounds.width / CGFloat(numberOfNotes)
        let noteHeight:CGFloat = bounds.height
        
        for _ in 0..<numberOfNotes{
            let noteView = NoteView(frame: CGRect(x: originX, y: 0, width: noteWidth, height: noteHeight))
            
            noteView.backgroundColor = UIColor.white
            
            addSubview(noteView)
            let line = UIView(frame: CGRect(x: originX, y: 0, width: 1, height: noteHeight))
            line.backgroundColor = UIColor.black
            addSubview(line)
            
            originX += noteWidth
        }
        
        originX = noteWidth / 2 //diez is in the middle of the key 25
        let diezHeight = noteHeight * 0.6 //copied from damir
        for _ in 0...4{
            let diezView = NoteView(frame: CGRect(x: originX, y: 0, width: noteWidth, height: diezHeight))
            diezView.backgroundColor = UIColor.black
            
            //mi si
            
            addSubview(diezView)
            originX += noteWidth * 2
        }
    }
}
