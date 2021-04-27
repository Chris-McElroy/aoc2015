//
//  day01.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/1/21.
//

import Foundation

func day01() {
    let input = inputLines(1)
    
    var a1 = 0, a2 = 0
    
    for (i,c) in input[0].enumerated() {
        a1 += c == "(" ? 1 : -1
        
        if a1 == -1 && a2 == 0 {
            a2 = i+1
        }
    }
    
    print("01:", a1,a2)
}
