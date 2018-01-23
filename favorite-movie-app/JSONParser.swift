//
//  JSONParser.swift
//  favorite-movie-app
//
//  Created by Simon Peter Ssekamatte on 1/22/18.
//  Copyright © 2018 sp_ssekamatte. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options)
            as? [String: AnyObject]
            
            return json!
        } catch (let parseError) {
            print("There was an error parsing the JSON: \"\(parseError.localizedDescription)\"")
        }
        return nil
    }
}
