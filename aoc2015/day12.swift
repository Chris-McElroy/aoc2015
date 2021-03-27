//
//  day12.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/24/21.
//

import Foundation

func day12() {
    let input = inputLines(12)[0]
    
    var sum1 = 0
    var sum2: [(Bool, Int)] = [(true, 0)]
    var arrDepth: [Bool] = []
    var num = ""
    var red = ""
    
    for c in input {
        if c.isin("-1234567890") {
            num.append(c)
        } else if c.isin("red") {
            red.append(c)
        } else {
            if red == "red" && arrDepth.last != true {
                sum2[sum2.count-1].0 = false
            }
            red = ""
            
            if let n = Int(num) {
                sum1 += n
                sum2[sum2.count-1].1 += n
            }
            num = ""
            
            if c == "[" {
                arrDepth.append(true)
            } else if c == "]" {
                arrDepth.removeLast()
            }
            
            if c == "{" {
                sum2.append((true,0))
                arrDepth.append(false)
            } else if c == "}" {
                arrDepth.removeLast()
                let last = sum2.popLast()!
                if last.0 {
                    sum2[sum2.count-1].1 += last.1
                }
            }
        }
    }
    
    let a1 = sum1
    let a2 = sum2.first!.1
    
    print(a1, a2)
}

// 111754 65402
