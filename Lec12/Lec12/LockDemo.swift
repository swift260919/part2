//
//  LockDemo.swift
//  Lec12
//
//  Created by HACKERU on 25/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class LockDemo{
    private let lock = NSLock()
    
    private let bathroomLock = NSLock()
    
    //one at a time, please.
    func writeOnBoard(){
        lock.lock()
        print("Writing")
        lock.unlock()
    }

    //one at a time, please.
    func useToielet(){
        bathroomLock.lock()
        print("using :)")
        bathroomLock.unlock()
    }

}
