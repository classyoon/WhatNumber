//
//  PersonView.swift
//  WhatNumber
//
//  Created by Conner Yoon on 5/25/24.
//


import SwiftUI
import SwiftData

struct PersonView: View {
    @Bindable var person : Person
    var body: some View {
        TextField("Type Person", text: $person.name)
    }
}



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Person.self, configurations: config)
    @State var testPerson = Person()
    container.mainContext.insert(testPerson)
    return PersonView(person: testPerson)
}
