//
//  elephant.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import Foundation

/// Elephant model
struct Elephant: Codable {
    var identifier: String?
    var index: Int?
    var name: String?
    var affiliation: String?
    var species: String?
    var gender: String?
    var fictional: String?
    var dob: String?
    var wikilink: String?
    var image: String?
    var note: String?

    init(identifier: String? = nil,
         index: Int? = nil,
         name: String? = nil,
         affiliation: String? = nil,
         species: String? = nil,
         gender: String? = nil,
         fictional: String? = nil,
         dob: String? = nil,
         wikilink: String? = nil,
         image: String? = nil,
         note: String? = nil) {

        self.identifier = identifier
        self.index = index
        self.name = name
        self.affiliation = affiliation
        self.species = species
        self.gender = gender
        self.fictional = fictional
        self.dob = dob
        self.wikilink = wikilink
        self.image = image
        self.note = note
    }

    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case index
        case name
        case affiliation
        case species
        case gender
        case fictional
        case dob
        case wikilink
        case image
        case note
    }
}
