//
//  day14.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/29/21.
//

import Foundation

func day14() {
    let input = inputWords(14)
    let limit = 2503
    let num = input.count
    
    let speeds = input.map { Int($0[3])! }
    let goTimes = input.map { Int($0[6])! }
    let periods = input.map { Int($0[6])!+Int($0[13])! }
    var distances = input.map { _ in 0 }
    var points = input.map { _ in 0 }
    
    for t in stride(from: 0, to: limit, by: 1) {
        for i in stride(from: 0, to: num, by: 1) {
            if t % periods[i] < goTimes[i] {
                distances[i] += speeds[i]
            }
        }
        
        for i in stride(from: 0, to: num, by: 1) {
            if distances[i] == distances.max() {
                points[i] += 1
            }
        }
    }
    
    let a1 = distances.max()!
    let a2 = points.max()!
    print(a1, a2)
}

// 2660 1256
