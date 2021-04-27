//
//  day03.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/5/21.
//

import Foundation

func day03() {
    let input = inputLines(3)[0]
    
    var l1 = [[0,0]]
    var l2 = [[0,0],[0,0]]
    let d: [Character: (Int, Int)] = [">": (1,0), "<": (-1,0), "^": (0,1), "v": (0,-1)]
    
    for c in input {
        let p1 = l1[l1.count-1]
        let p2 = l2[l2.count-2]
        l1.append([p1[0]+d[c]!.0,p1[1]+d[c]!.1])
        l2.append([p2[0]+d[c]!.0,p2[1]+d[c]!.1])
    }
    
    let a1 = Set(l1).count
    let a2 = Set(l2).count
    
    print("03:", a1,a2)
}
