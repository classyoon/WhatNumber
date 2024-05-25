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
    var body: some View {
        VStack{
            TextField("Credit Name", text: $creditCard.name)
            TextField("Credit Number", text: $creditCard.number)
            TextField("Who can acess", text: $creditCard.whoIsAllowed)
        }
        
    }
}
@Model
class CreditCard {
    var name : String = ""
    var number : String = ""
    var whoIsAllowed : String = ""
    init(name: String, number: String, whoIsAllowed: String) {
        self.name = name
        self.number = number
        self.whoIsAllowed = whoIsAllowed
    }
    init(){
        self.name = ""
        self.number = ""
        self.whoIsAllowed = ""
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CreditCard.self, configurations: config)
    @State var creditCard = CreditCard()
    container.mainContext.insert(creditCard)
    return CreditView(creditCard: creditCard)
}
