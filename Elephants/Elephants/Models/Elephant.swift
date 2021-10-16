//
//  elephant.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import Foundation

/// Elephant model
struct Elephant {
    var _id: String?
    var index: Int?
    var name: String?
    var affiliation: String?
    var species: String?
    var sex: Sex
    var fictional: Bool?
    var dob: Int?
    var wikilink: String?
    var image: String?
    var note: String?
    
    init(_id: String? = nil,
         index: Int? = nil,
         name: String? = nil,
         affiliation: String? = nil,
         species: String? = nil,
         sex: Sex = .none,
         fictional: Bool? = nil,
         dob: Int? = nil,
         wikilink: String? = nil,
         image: String? = nil,
         note: String? = nil) {
        
        self._id = _id
        self.index = index
        self.name = name
        self.affiliation = affiliation
        self.species = species
        self.sex = sex
        self.fictional = fictional
        self.dob = dob
        self.wikilink = wikilink
        self.image = image
        self.note = note
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case index
        case name
        case affiliation
        case species
        case sex
        case fictional
        case dob
        case wikilink
        case image
        case note
    }
}
