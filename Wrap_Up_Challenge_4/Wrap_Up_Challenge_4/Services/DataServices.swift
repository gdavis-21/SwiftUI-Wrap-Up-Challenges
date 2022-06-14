//
//  DataServices.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import Foundation

class DataServices {
    
    static func decodeJSON() -> [Book] {
        
        // Get path to Data.JSON in app bundle
        if let path = Bundle.main.path(forResource: "Data", ofType: "json") {
            
            // Generate URL object from path
            let URL = URL(fileURLWithPath: path)
            
            // Generate Data object from URL
            do {
                let data = try Data(contentsOf: URL)
                
                // Create JSON decoder object
                let decoder = JSONDecoder()
                
                // Try to decode Data object into [Book]
                do {
                    let result = try decoder.decode([Book].self, from: data)
                    
                    return result
                }
                catch {
                    // Unable to decode Data object
                    print(error)
                }
            }
            catch {
                // Unable to create Data object from URL
                print(error)
            }
        }
        // Some problem occured, return empty array
        return [Book]()
    }
}
