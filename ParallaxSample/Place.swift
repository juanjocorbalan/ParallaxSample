//
//  Place.swift
//  ParallaxSample
//
//  Created by Juanjo Corbalan on 13/5/24.
//

import Foundation

struct Place: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
}

var places: [Place] = [
    Place(title: "New York", image: "newyork"),
    Place(title: "London", image: "london"),
    Place(title: "Tokyo", image: "tokyo"),
    Place(title: "Rome", image: "rome"),
]
