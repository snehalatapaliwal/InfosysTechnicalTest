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
        
        guard let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=1&limit=10") else {
            print("Error unwrapping URL"); return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else { print("Error getting data"); return }
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSArray {
                    completion(responseJSON)
                }
            } catch {
                completion(nil)
                print("Error getting API data: \(error.localizedDescription)")
            }
        }
        //10 -
        dataTask.resume()
    }
    
}

