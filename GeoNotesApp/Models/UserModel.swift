//
//  UserModel.swift
//  GeoNotesApp
//
//  Created by S Trq on 23/7/17.
//  Copyright © 2017 S Trq. All rights reserved.
//

import Foundation

class UserModel: JsonMappable {

    var name: String!
    var notes: [String]!
    
    init(_ name: String) {
        self.name = name
        notes = []
    }
    
    required init?(json: [String: Any]) {
        self.name = convert(key: "name", from: json)
        self.notes = convert(key: "notes", from: json)
    }
    
    var toJson: [String: Any] {
        var json = [String: Any]()
        convert(value: self.name, in: &json, with: "name")
        convert(value: self.notes, in: &json, with: "notes")
        return json
    }
}
