//
//  DummyData.swift
//  Restaurant menu
//
//  Created by Vineet Rai on 22/03/21.
//

import Foundation

class DummyData{
    private init(){}
    static let shared = DummyData()
    let food:Array = [[
        "Name": " North Indian ",
        "image": "north-indian",
        "Top3": ["a","b","c"],
    ],[
        "Name": " South Indian ",
        "image": "south-indian",
        "Top3": ["a","b","c"],
    ],[
        "Name": " Italian ",
        "image": "italian",
        "Top3": ["a","b","c"],
    ],[
        "Name": " Mexican ",
        "image": "mexican",
        "Top3": ["a","b","c"],
    ],[
        "Name": " Thai ",
        "image": "thai",
        "Top3": ["a","b","c"],
    ],[
        "Name": " Chinise ",
        "image": "chinise",
        "Top3": ["a","b","c"],
    ]]
}
