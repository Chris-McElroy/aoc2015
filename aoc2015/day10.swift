//
//  day10.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/21/21.
//

import Foundation

func day10() {
    var input = inputLines(10)[0]
    
    func say() {
        var new = ""
        var last: Character = "a"
        var count = 0
        
        for c in input {
            if c == last {
                count += 1
            } else {
                new += String(count) + String(last)
                last = c
                count = 1
            }
        }
        
        new += String(count) + String(last)
        input = String(new.dropFirst(2))
    }
    
    for _ in 0..<40 { say() }
    let a1 = input.count
    
    for _ in 0..<10 { say() }
    let a2 = input.count
    
    print(a1, a2)
}
