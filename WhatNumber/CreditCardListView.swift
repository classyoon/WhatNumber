//
//  CreditCardListView.swift
//  WhatNumber
//
//  Created by Conner Yoon on 5/25/24.
//

import SwiftUI
import SwiftData

struct CreditCardListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var creditList : [CreditCard]
    var body: some View {
        NavigationStack{
            List {
                ForEach(creditList){ credit in
                    CreditView(creditCard: credit)
                }.onDelete(perform: deleteItems)
            }.navigationTitle("Credits")
                .toolbar {
                    EditButton()
                    Button(action: {
                        addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
        }
    }
    private func addItem() {
        withAnimation {
            let newItem = CreditCard()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(creditList[index])
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CreditCard.self, configurations: config)
    
    return CreditCardListView()
        .modelContainer(container)
   
}
