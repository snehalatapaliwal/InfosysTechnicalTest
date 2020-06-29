//
//  ViewModel.swift
//  Jet2TravelTechnicalTest
//
//  Created by apple on 09/05/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol reloadTableViewDelegate {
    func reloadTableView()
}

public class ViewModel {
    
    var items = [Model]()
    var reloadDelegate: reloadTableViewDelegate?
    var apiClient = APIClient()
    var itemJson: NSArray!
    
    func getApps(completion: @escaping () -> Void) {
        apiClient.fetchList { (arrayOfAppsDictionaries) in
            DispatchQueue.main.async {
                self.itemJson = arrayOfAppsDictionaries
                completion()
            }
        }
    }
    
    init(viewDelegate: reloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        getApps {
            self.items = Model.modelFromDictionnaryArray(array: self.itemJson as NSArray)
            self.reloadDelegate?.reloadTableView()
        }
    }
    
}

