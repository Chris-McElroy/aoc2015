//
//  day02.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/1/21.
//

import Foundation

func day02() {
    let input = inputLines(2)
    
    var a1 = 0
    var a2 = 0
    
    for p in input {
        let d = p.split(separator: "x").map { Int($0)! }
        a1 += 2*(d[0]*d[1] + d[1]*d[2] + d[2]*d[0]) + min(d[0]*d[1], d[1]*d[2], d[2]*d[0])
        a2 += 2*d.sorted()[0, 2].sum() + d.product()
    }
    
    print(a1,a2)
}
