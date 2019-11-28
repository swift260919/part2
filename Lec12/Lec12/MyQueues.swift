//
//  MyQueues.swift
//  Lec12
//
//  Created by HACKERU on 25/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

struct MyQueues {
    
    //ui queue
    //Array<closure> tasks
    let mainQueue = DispatchQueue.main
    //the only queue that may update user interface (ui)
    
    //more Dispatch Queues: - qos = Quality of service
    
    //  qos - proccessing time
    let defaultQueue = DispatchQueue.global(qos: .default )
    let userInteractive = DispatchQueue.global(qos: .userInteractive)
    let userInitiated = DispatchQueue.global(qos: .userInitiated)
    let background = DispatchQueue.global(qos: .background)
    let utility = DispatchQueue.global(qos: .utility)
    
    //serial queue //krpvdklp23k5opk1
    let serialQuque = DispatchQueue(label: "aa")

    //async functions should not return a value using the return keyword
    //to return a value we may use a delegate:
    func growPumpkin(delegate: PumpkinDelegate){
        
        //code that takes a lot of time
        background.async {
            sleep(10)
            let result = "pumpkin 🎃"
            
            self.mainQueue.async{
                delegate.done(result: result, err: nil)
            }
        }
    }
    
    //the @escaping keyword informs us that the closure is passed on
    func growPumpkinV2(callback: @escaping (String? ,Error?)->Void){
        background.async {
            sleep(10)
            let result = "pumpkin 🎃"
            
            //report the result on the ui thread
            self.mainQueue.async{
                callback(result, nil)
            }
        }
    }
    
    
    //usage?
    func demo(){
        //a->b->c
        serialQuque.async {
            print("a started")
            sleep(1)
            print("a finished")
        }
        
        serialQuque.async {
            print("b started")
            sleep(1)
            print("b finished")
        }
        
        serialQuque.async {
            print("c started")
            sleep(1)
            print("c finished")
        }// 3 seconds
        
        
        
        
        //run in parelel
        background.async {
            //code that runs in the background queue
            print("Background 1 started")
            sleep(5)//in seconds
            print("Background 1 finished")
        }
        
        background.async {
            //code that runs in the background queue
            print("Background 2 started")
            sleep(5)//in seconds
            print("Background 2 finished")
        }
        //a + b
        
        
        //a -> b
        background.async {
            print()
            sleep(2)
            print("")
            
            //
            self.background.async {
                //
            }
        }
    }
}
 


protocol PumpkinDelegate {
    func done(result: String?, err: Error?)
}






//AsyncTask
//do in background (background)
//optional report progress (ui thread)
//done (ui thread)


struct Async{
    var bg: ()->Void
    var uiThread: ()->Void
}






















