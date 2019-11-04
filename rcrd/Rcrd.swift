//
//  Rkrd.swift
//  rcrd
//
//  Created by Patrick McElroy on 10/25/19.
//  Copyright © 2019 Patrick McElroy. All rights reserved.
//
import Foundation
import os.log

class Rcrd: NSObject, NSCoding {
    
    var rcrdName: String
    var rcrdValuesArray: [String] = []
    
    init(_ nameIn: String,_ arrayIn: [String]) {
        rcrdName = nameIn
        rcrdValuesArray = arrayIn
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(rcrdName, forKey: "name")
        aCoder.encode(rcrdValuesArray, forKey: "values")
    }
    
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let array = coder.decodeObject(forKey: "values") as! [String]
        
        self.init(name, array)
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("rcrds")
    

}