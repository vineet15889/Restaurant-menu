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
        guard let path = Bundle.main.path(forResource: "DummyList", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String:Any]] else {return}
        food = plist
    }
    static let shared = DummyData()
}
