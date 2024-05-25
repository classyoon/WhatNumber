//
//  PeopleListView.swift
//  WhatNumber
//
//  Created by Conner Yoon on 5/25/24.
//

import SwiftUI
import SwiftData

struct PeopleListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var peopleList : [Person]
    var body: some View {
        NavigationStack{
            List {
                ForEach(peopleList){ person in
                    PeopleView(person: person)
                }.onDelete(perform: deleteItems)
            }.navigationTitle("Users")
                .toolbar {
                    EditButton()
                    Button(action: {
                        addPerson()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
        }
    }
    private func addPerson() {
        withAnimation {
            let newItem = Person()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(peopleList[index])
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Person.self, configurations: config)
    return PeopleListView()
        .modelContainer(container)
}
