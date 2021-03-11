//
//  day05.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/10/21.
//

import Foundation

func day05() {
    let input = inputLines(5)
    let bad = ["ab","cd", "pq", "xy"]
    
    var a1 = 0
    var a2 = 0
    
    for s in input {
        let t1 = s.filter({ $0.isin("aeiou") }).count >= 3
        let t2 = !s.enumerated().dropFirst().filter({ i,c in c == s[i-1] }).isEmpty
        let t3 = bad.filter({ s.contains($0) }).isEmpty
        let t4 = !s.enumerated().dropFirst(2).filter({ i,c in c == s[i-2] }).isEmpty
        let t5 = !s.enumerated().dropFirst(3).filter({ i,_ in s[0,i-1].contains(s[i-1,i+1]) }).isEmpty
        
        a1 += (t1 && t2 && t3).int
        a2 += (t4 && t5).int
    }
    
    print(a1, a2)
}
