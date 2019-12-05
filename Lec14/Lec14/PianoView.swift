//
//  PianoView.swift
//  Lec14
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class PianoView: UIView {

    let notes = ["a1", "b1", "c1", "d1", "e1", "f1", "g1","c2", "a1", "b1", "c1", "d1", "e1", "f1"]
    
    let sharps = ["a1s", "c1s", "f1s", "g1s", "a1s"]

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
        
        for i in 0..<numberOfNotes{
            let noteView = NoteView(frame: CGRect(x: originX, y: 0, width: noteWidth, height: noteHeight))
            noteView.note = notes[i]
            
            noteView.backgroundColor = UIColor.white
            
            addSubview(noteView)
            let line = UIView(frame: CGRect(x: originX, y: 0, width: 1, height: noteHeight))
            line.backgroundColor = UIColor.black
            addSubview(line)
            
            originX += noteWidth
        }
        
        originX = noteWidth / 2 //diez is in the middle of the key 25
        let diezHeight = noteHeight * 0.6 //copied from damir
        for i in 0...4{
            let diezView = NoteView(frame: CGRect(x: originX, y: 0, width: noteWidth, height: diezHeight))
            diezView.note = sharps[i]
            diezView.backgroundColor = UIColor.black
            
            //mi si
            
            addSubview(diezView)
            originX += noteWidth * 2
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        initTapGestureRecognizer()
        initPanGestureRecognizer()
    }
    
    
    func initPanGestureRecognizer(){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleGestureEvent(_:)))
        
        panGestureRecognizer.maximumNumberOfTouches = 10
        
        addGestureRecognizer(panGestureRecognizer)
    }
    
    func initTapGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleGestureEvent(_:)))
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    @objc func handleGestureEvent(_ sender: UIGestureRecognizer){
        for i in 0..<sender.numberOfTouches{
            let point = sender.location(ofTouch: i, in: self)
            handleTouch(at: point)
        }
    }
    
    func handleTouch(at point: CGPoint){
        //point iterate over all NoteViews and check if the point is inside their frame.
        guard let noteView = self.hitTest(point, with: nil) as? NoteView else {return}
        noteView.play()
    }
}
