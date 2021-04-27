//
//  day17.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/5/21.
//

import Foundation

func day17() {
    let input = inputInts(17)
    var sets: [Set<Set<Int>>] = [[[]]]

    for n in 1...150 {
        sets.append([])
        for i in 0..<input.count {
            for s in sets[s: n - input[i]] ?? [] {
                if !s.contains(i) {
                    sets[n].insert(s.union([i]))
                }
            }
        }
    }

    let countList = sets[150].map { $0.count }
    let a1 = countList.count
    let a2 = countList.repeats(of: countList.min()!)
    
    print("17:", a1, a2)
}
// 1638 17
