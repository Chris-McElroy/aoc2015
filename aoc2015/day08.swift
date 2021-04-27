//
//  day08.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/17/21.
//

import Foundation

func day08() {
    let input = inputLines(8)
    var a1 = 0
    var a2 = 0
    
    for line in input {
        var text = line.dropFirst()
        a1 += line.repeats(of: "\"")
        
        while !text.isEmpty {
            if text.hasPrefix("\\x") {
                a1 += 3
            }
            
            if text.hasPrefix("\\\\") {
                text = text.dropFirst()
                a1 += 1
            }
            
            text.removeFirst()
        }
    }
    
    for line in input {
        a2 += 2
        a2 += line.repeats(of: "\"")
        a2 += line.repeats(of: "\\")
    }
    
    print("08:", a1,a2)
}
