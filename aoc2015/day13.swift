//
//  day13.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/26/21.
//

import Foundation

func day13() {
    let input = inputLines(13)
    
    var names: [Substring] = []
    var hDict: [[Substring]: Int] = [:]
    
    for line in input {
        let s = line.split(separator: " ")
        let n = Int(s[3])!
        let a = s[0]
        let b = s[10].dropLast()
        
        hDict[[a,b]] = s[2] == "lose" ? -n : n
        
        if !a.isin(names) { names.append(a) }
    }
    
    var paths: [[Substring]] = []
    permutations(len: names.count, &names, output: &paths)
    
    var a1 = 0
    var a2 = 0
    
    for path in paths {
        var s = 0
        var i = 0
        var min = Int.max
        
        while i < path.count {
            let conn = hDict[[path[w: i+1]!, path[w: i]!]]! + hDict[[path[w: i]!, path[w: i+1]!]]!
            s += conn
            if conn < min { min = conn }
            i += 1
        }

        if s > a1 { a1 = s }
        if s - min > a2 { a2 = s - min }
    }
    
    print(a1, a2)
}

// 709 668
