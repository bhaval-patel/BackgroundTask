//
//  ListPresenter.swift
//  SOBackgroundTask
//
//  Created by SOTSYS038 on 03/07/19.
//  Copyright © 2019 SOTSYS038. All rights reserved.
//

import UIKit
import Photos

protocol ListPresentationprotocol {
    func fetchData() -> [List]?
    func setNewData()
    func clearData()
}

class ListPresenter: ListPresentationprotocol {
    //MARK: [Property]
    weak var viewController:  ListProtocol?
    var interator: ListInterator?
    
    //MARK: [Method]
    func fetchData() -> [List]? {
        return interator?.getListData()
    }
    
    func setNewData() {
        var estimatedCount = 0
        let collections = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
        collections.enumerateObjects { (collection, idx, stop) in
            estimatedCount += collection.estimatedAssetCount
        }
        
        interator?.setData(count: Double(estimatedCount))
    }
    
    func clearData() {
        interator?.clearData()
    }
}
