//
//  Points.swift
//  TaipeiTour0823
//
//  Created by Steve Lai on 2022/8/23.
//

import Foundation


struct Points: Codable{
    var total: Int
    var data: [Point]
    struct Point: Codable{
        var name: String
        var introduction: String
        var nlat: Double
        var elong: Double
    }
}
