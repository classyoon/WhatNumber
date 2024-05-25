//
//  CreditView.swift
//  WhatNumber
//
//  Created by Conner Yoon on 5/25/24.
//

import SwiftUI
import SwiftData

struct CreditView: View {
    @Bindable var creditCard : CreditCard
    var samplePeople : [Person] = [Person(name: "Sven"), Person(name: "Joe"), Person(name: "Mary")]
    var body: some View {
        VStack{
            TextField("Credit Name", text: $creditCard.name)
            TextField("Credit Number", text: $creditCard.number)
           
                TextField("Who can acess", text: $creditCard.whoIsAllowed)
    
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CreditCard.self, configurations: config)
    @State var creditCard = CreditCard()
    container.mainContext.insert(creditCard)
    return CreditView(creditCard: creditCard)
}
