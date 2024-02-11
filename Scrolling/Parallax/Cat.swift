//
//  Cat.swift
//  Scrolling
//
//  Created by Juan Hernandez Pazos on 11/02/24.
//

import Foundation

struct Cat: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var image: String
}

// Cats list
var catsList: [Cat] = [
    Cat(title: "Lucrecia", subTitle: "Sample photo Lucrecia", image: "1"),
    Cat(title: "Booker", subTitle: "Sample photo Booker", image: "2"),
    Cat(title: "Fionna", subTitle: "Sample photo Fionna", image: "3"),
    Cat(title: "Lucrecia", subTitle: "Sample photo Lucrecia", image: "4"),
    Cat(title: "Booker", subTitle: "Sample photo Booker", image: "5")
]
