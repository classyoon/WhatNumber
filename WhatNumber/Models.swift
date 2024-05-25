//
//  Models.swift
//  WhatNumber
//
//  Created by Conner Yoon on 5/25/24.
//

import Foundation
import SwiftData
@Model
class CreditCard {
    var name : String = ""
    var number : String = ""
    @Relationship(inverse: \Person.cards) var whoIsAllowed: [Person]
    init(name: String, number: String, whoIsAllowed: [Person]) {
        self.name = name
        self.number = number
        self.whoIsAllowed = whoIsAllowed
    }
    init(){
        self.name = ""
        self.number = ""
        self.whoIsAllowed = []
    }
}
@Model
class Person : Hashable {
    var name : String = ""
    var cards : [CreditCard]
    init(name: String) {
        self.name = name
        self.cards = []
    }
    init(){
        self.name = ""
        self.cards = []
    }
}
