//
//  day06.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/10/21.
//

import Foundation

func day06() {
    
    let input = inputLines(6)
    
    var l1 = Array(repeating: false, count: 1000000)
    var l2 = Array(repeating: 0, count: 1000000)
    
    for line in input {
        let word = line.split(separator: " ")
        let start = word[word.count-3].split(separator: ",")
        let end = word[word.count-1].split(separator: ",")
        var x = Int(start[0])!
        let yStart = Int(start[1])!
        let xEnd = Int(end[0])!
        let yEnd = Int(end[1])!
        
        // brought the if statements out to improve run time
        if word[1] == "on" {
            while x <= xEnd {
                var y = yStart
                while y <= yEnd {
                    l1[x*1000+y] = true
                    l2[x*1000+y] += 1
                    y += 1
                }
                x += 1
            }
        } else if word[1] == "off" {
            while x <= xEnd {
                var y = yStart
                while y <= yEnd {
                    l1[x*1000+y] = false
                    l2[x*1000+y] = max(l2[x*1000+y] - 1, 0)
                    y += 1
                }
                x += 1
            }
        } else {
            while x <= xEnd {
                var y = yStart
                while y <= yEnd {
                    l1[x*1000+y].toggle()
                    l2[x*1000+y] += 2
                    y += 1
                }
                x += 1
            }
        }
    }
    
    let a1 = l1.reduce(0, { s, l in s + l.int })
    let a2 = l2.sum()
    
    print(a1, a2)
}
