//
//  DummyData.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import Foundation

class DummyData{
    var food:[[String:Any]]  = [[:]]
    
    private init(){
        self.refreshData()
    }
    
    static let shared = DummyData()
    
    func refreshData(){
        guard let path = Bundle.main.path(forResource: "DummyList", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String:Any]] else {return}
        self.food = plist
    }
    
    func updateData(cusineIndex:Int,foodIndex:Int, quantity:Int){
        var foodArray:Array = food[cusineIndex]["Top3"] as! [[String:Any]]
        var dict = foodArray[foodIndex]
        dict["quantity"] = String(describing:quantity)
        foodArray[foodIndex] = dict
        self.food[cusineIndex]["Top3"] = foodArray;
       
    }
}


