//
//  ListEntity.swift
//  SOBackgroundTask
//
//  Created by SOTSYS038 on 03/07/19.
//  Copyright © 2019 SOTSYS038. All rights reserved.
//

import Foundation

struct List {
    var date: String?
    var count: String?
    
    init(date: String?, count: String?) {
        self.date = date
        self.count = count
    }
}

class ListEntity {
    class func getAllList (data: [[String: Any]]) -> [List] {
        var arrList = [List]()
        data.forEach { (obj) in
            let newList = List(date: obj["date"] as? String , count: obj["count"] as? String)
            arrList.append(newList)
        }
        return arrList
    }
}
