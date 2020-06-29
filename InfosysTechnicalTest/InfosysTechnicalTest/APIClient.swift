//
//  APIClient.swift
//  Jet2TravelTechnicalTest
//
//  Created by apple on 10/05/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import UIKit
import CoreData

class APIClient: NSObject {
    
    func fetchList(completion: @escaping (NSArray?) -> Void) {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {
            print("Error unwrapping URL"); return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else { print("Error getting data"); return }
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSArray {
                    completion(responseJSON)
                }
            } catch {
                completion(NSArray())
                print("Error getting API data: \(error.localizedDescription)")
            }
        }
        //10 -
        dataTask.resume()
    }
    
}

