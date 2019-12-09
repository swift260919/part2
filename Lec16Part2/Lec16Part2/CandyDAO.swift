//
//  CandyDAO.swift
//  Lec16Part2
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData

class CandyDAO{
    
    //singleton:
    private init(){}
    static let shared = CandyDAO()
    
    //computed property to get the context from the app delegate.
    //short cut to get the context:
    var context:NSManagedObjectContext!{
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }
    
    
    //cache all the candies
    var candies:[Candy] = []
    
    
    func fetchAllCandies() -> [Candy]{
        //init a fetch request -> get it from the Candy class
        let fetchRequst: NSFetchRequest<Candy> = Candy.fetchRequest()
        //issue the request against the context:
        if let result = try? context.fetch(fetchRequst){
            self.candies = result
        }
        
        return candies
    }
    
    //Injection
    //1234 OR 1==1
    func equalsPredicate(name: String)->[Candy]{
        //init a fetch request -> get it from the Candy class
        let fetchRequst: NSFetchRequest<Candy> = Candy.fetchRequest()
        
        //add a predicate
        //%d for numbers
        //%@ object - string
        let predicate = NSPredicate(format: "name ==  %@", name)
        //let predicate = NSPredicate(format: "age >  %d", age)
        //>, < !=
        //let predicate = NSPredicate(format: "name == %@ AND password == %@, name, password)"
        fetchRequst.predicate = predicate
        
        //issue the request against the context:
        if let result = try? context.fetch(fetchRequst){
            return result
        }
        return []
    }
    
    func beginsWithPredicate(name: String)->[Candy]{
        //init a fetch request -> get it from the Candy class
        let fetchRequst: NSFetchRequest<Candy> = Candy.fetchRequest()
        
        //add a predicate
        //%d for numbers
        //%@ object - string
        
        //[c]case insensitive.
        //[d]diacritic insensitive.
        //let predicate = NSPredicate(format: "name ENDSWITH[cd]  %@", name)
        let predicate = NSPredicate(format: "name BEGINSWITH[cd]  %@", name)
        //let predicate = NSPredicate(format: "name == %@ AND password == %@, name, password)"
        fetchRequst.predicate = predicate
        
        //issue the request against the context:
        if let result = try? context.fetch(fetchRequst){
            return result
        }
        return []
    }
    
    
    func containsPredicate(name: String)->[Candy]{
        //init a fetch request -> get it from the Candy class
        let fetchRequst: NSFetchRequest<Candy> = Candy.fetchRequest()
        
        //add a predicate
        //%d for numbers
        //%@ object - string
        
        //[c]case insensitive.
        //[d]diacritic insensitive.
        //let predicate = NSPredicate(format: "name ENDSWITH[cd]  %@", name)
        let predicate = NSPredicate(format: "name CONTAINS[cd]  %@", name)
        //let predicate = NSPredicate(format: "name == %@ AND password == %@, name, password)"
        fetchRequst.predicate = predicate
        
        //issue the request against the context:
        if let result = try? context.fetch(fetchRequst){
            return result
        }
        return []
    }
    
    
    
    func usePredicateWithoutCoreData(name: String){
        //we have an array:
         let predicate = NSPredicate(format: "name CONTAINS[cd]  %@", name)
        //we may filter the array using the predicate
        
        //Array.filter(item -> true or false)
        let filteredCandies = candies.filter { (candy) -> Bool in
            //return true //keep all the candies
            return predicate.evaluate(with: candy)
        }
        
        print(filteredCandies)
        
        
        //same as: print(candies.filter{predicate.evaluate(with: $0)})
    }
    
    //IN BETEWEN
    
    func searchBetween(from: Int, to: Int){
        let predicate = NSPredicate(format: "age BETWEEN {%d, %d}", from, to)
    }
    
    
    func searchIn(){
        //IN ignores CD
        
        //good for customers in Germany OR England OR US
        let pred = NSPredicate(format: "name IN {%@, %@, %@}", "Kitkat", "Oreo", "Twix")
    }
 
    //SortDescriptors
    func sortCandies()->[Candy]{
        let fetchRequest: NSFetchRequest<Candy> = Candy.fetchRequest()
        //fetchRequest.predicate = //we can use predicate as well
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        
        if let result = try? context.fetch(fetchRequest){
            return result
        }
        return []
    }
    
    //custom sort
    func sortCandiesCaseInsensitive()->[Candy]{
        let fetchRequest: NSFetchRequest<Candy> = Candy.fetchRequest()
        //fetchRequest.predicate = //we can use predicate as well
         
        //func in swift that can compare strings case insensitve
        
        //selector is a pointer to a function
        let compareIS = #selector(NSString.caseInsensitiveCompare(_:))
        
        //func
        let caseInsensitiveSortdescriptor = NSSortDescriptor(key: "name", ascending: true, selector: compareIS)
        
        fetchRequest.sortDescriptors = [
            caseInsensitiveSortdescriptor
        ]
        
        
        if let result = try? context.fetch(fetchRequest){
            return result
        }
        return []
    }
    
    
    func countEfficiently()->Int{
        let fetchRequest: NSFetchRequest<Candy> = Candy.fetchRequest()
        let count = try! context.count(for: fetchRequest)
        return count
    }
    
    
    //TableView use the story board to create cells
    
    
    //from error handling in core data by apple
    func addCandy(name:String){
        let c = Candy(context: context)
        c.name = name
        
        do{
            //validation is for inserts
            try c.validateForInsert()
            try context.save()
        }catch let e as NSError{
            print(e)//callback ,delegate
            
            //e.domain // NSCocoaErrorDomain
            //e.code // 1670
            //e.localizedDescription//name is too short.
            //NSValidationErrorKey  //=name
            //e.userInfo["NSValidationErrorKey"] // name
            //e.userInfo["NSValidationErrorValue"] // a
        }
        
        //add the candy to the cache
        candies.append(c)
    }
    
}
