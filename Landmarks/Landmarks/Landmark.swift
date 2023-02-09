//
//  Landmark.swift
//  Landmarks
//
//  Created by Joshua Ibrom on 2/9/23.
//

import Foundation


struct Landmark: Hashable, Codable {
    var id: Int,
    var name: String,
    var park: String,
    var state: String,
    var description: String
}
