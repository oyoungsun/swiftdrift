//
//  MissionModel.swift
//  swiftdrift
//
//  Created by 김은정 on 9/21/24.
//

import Foundation
import SwiftData


@Model
class Mission {
    let name: String
    let tag: Int
    
    let tittle: String
    let info: String
    
    
    let latitude: Double
    let longitude: Double
    
    var pass: Bool

    init(name: String, tag: Int, tittle: String, info: String, latitude: Double, longitude: Double, pass: Bool) {
        self.name = name
        self.tag = tag
        self.tittle = tittle
        self.info = info
        self.latitude = latitude
        self.longitude = longitude
        self.pass = pass
    }
}

