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
    .init(title: "New York", image: "newyork"),
    .init(title: "London", image: "london"),
    .init(title: "Japan", image: "japan"),
    .init(title: "Rome", image: "rome"),
]
