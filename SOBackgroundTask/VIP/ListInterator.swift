//
//  ListInterator.swift
//  SOBackgroundTask
//
//  Created by SOTSYS038 on 03/07/19.
//  Copyright © 2019 SOTSYS038. All rights reserved.
//

import UIKit
protocol  ListInteractorProtocol {
    func getListData() -> [List]?
    func setData(count: Double)
    func clearData()
}

class ListInterator {
    //MARK: [Property]
    var presenter: ListPresenter?
    
    //MARK: [Method]
    func setData(count: Double) {
        let date = getCurrentDate()
        
        if var data = getOldData() {
            var dict = [String: Any]() //New Dict
            dict["date"] = date
            dict["count"] = "\(count)"
            data.append(dict)
            UserDefaults.standard.set(data, forKey: "data") // Replace New Data
            print("New Data")
            
        } else {
            var dict = [String: Any]() //New Dict
            dict["date"] = date
            dict["count"] = "\(count)"
            UserDefaults.standard.set([dict], forKey: "data")
            print("New Data")
        }
    }
    
    func getListData() -> [List]? {
        if let data = UserDefaults.standard.value(forKey: "data") as? [[String: Any]], data.count > 0  {
            return ListEntity.getAllList(data: data)
        }
        return nil
    }
    
    func getOldData() ->  [[String: Any]]? {
        return UserDefaults.standard.value(forKey: "data") as? [[String: Any]]
    }
    
    func clearData() {
        UserDefaults.standard.removeObject(forKey: "data")
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
}
