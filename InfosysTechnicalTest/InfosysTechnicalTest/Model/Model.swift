//
//  Model.swift
//  Jet2TravelTechnicalTest
//
//  Created by apple on 09/05/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import Foundation

public class Model {
    var title: String?
    var description: String?
    var imageHrefUrl: String?
    
    init(title: String,
         description: String,
         imageHrefUrl: String) {
        self.title = title
        self.description = description
        self.imageHrefUrl = imageHrefUrl
    }
    
    init(dictionnary: NSDictionary) {
        title = dictionnary["title"] as? String
        description = dictionnary["description"] as? String
        imageHrefUrl = dictionnary["imageHrefUrl"] as? String
    }
    
    
    public class func modelFromDictionnaryArray(array: NSArray) -> [Model] {
        var items = [Model]()
        for data in array {
            items.append(Model(dictionnary: data as! NSDictionary))
        }
        return items
    }
    
}
