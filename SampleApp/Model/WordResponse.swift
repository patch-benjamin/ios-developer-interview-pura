//
//  WordResponse.swift
//  SampleApp
//
//  Created by natehancock on 6/28/22.
//

import Foundation


struct WordResponse: Codable {
    let meta: Meta
    let shortdef: [String]
    
    var word: Word {
        return Word(text: meta.stems.first!, definitions: shortdef)
    }
    
    static func parseData(_ data: Data) throws -> [WordResponse] {
        let response = try JSONDecoder().decode([WordResponse].self, from: data)
        return response
    }
}
