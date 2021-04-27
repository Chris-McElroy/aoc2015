//
//  day18.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/9/21.
//

import Foundation

func day18() {
    let input = inputLines(18)
    
    var curr1 = input.map { $0.map { ($0 == "#").int }}
    var next1: [[Int]] = []
    
    var curr2 = curr1
    var next2: [[Int]] = []
    
    let nei = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)]
    
    for _ in 0..<100 {
        for x in stride(from: 0, to: 100, by: 1) {
            next1.append([])
            next2.append([])
            for y in stride(from: 0, to: 100, by: 1) {
                var c1 = 0
                var c2 = 0
                for n in nei {
                    let xn = x+n.0
                    let yn = y+n.1
                    if xn >= 0 && xn < 100 && yn >= 0 && yn < 100 {
                        c1 += curr1[xn][yn]
                        c2 += curr2[xn][yn]
                    }
                }
                next1[x].append((c1 == 3 || (curr1[x][y] == 1 && c1 == 2)).int)
                next2[x].append((c2 == 3 || (curr2[x][y] == 1 && c2 == 2)).int)
            }
        }
        curr1 = next1
        curr2 = next2
        next1 = []
        next2 = []
        
        curr2[0][0] = 1
        curr2[0][99] = 1
        curr2[99][0] = 1
        curr2[99][99] = 1
    }
    
    let a1 = curr1.reduce(0) { x,y in x + y.repeats(of: 1)}
    let a2 = curr2.reduce(0) { x,y in x + y.repeats(of: 1)}
    
    print("18:", a1, a2)
}
// 768 781
