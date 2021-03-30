//
//  day13.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/26/21.
//

import Foundation

func day13() {
    var a1 = 0
    var a2 = 0
    let input = inputLines(13).map { $0.split(separator: " ") }
    
    var names: [Substring] = []
    var hDict: [[Substring]: Int] = [:]
    
    for s in input {
        let n = Int(s[3])!
        hDict[[s[0],s[10].dropLast()]] = s[2] == "lose" ? -n : n
        if !s[0].isin(names) { names.append(s[0]) }
    }
    
    let last = names.removeLast() // avoids starting point symmetries
    var paths: [[Substring]] = []
    permutations(len: names.count, &names, output: &paths)
    
    for path in paths {
        var s = 0
        var min = Int.max
        let table = path + [last]
        
        var i = 0
        while i < table.count {
            let conn = hDict[[table[w: i+1]!, table[w: i]!]]! + hDict[[table[w: i]!, table[w: i+1]!]]!
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
