//
//  day11.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/22/21.
//

import Foundation

func day11() {
    func isValid(_ p: String) -> Bool {
        var last: Character = "5"
        var streak = 0
        var gotStreak = false
        var pair: Character? = nil
        var gotPairs = false
        
        for c in p {
            if c.isin("iol") { return false }
            if c.asciiValue == last.asciiValue! + 1 {
                streak += 1
                if streak == 3 {
                    gotStreak = true
                }
            } else {
                streak = 1
                if c == last && !gotPairs {
                    if pair != nil && pair != c {
                        gotPairs = true
                    } else {
                        pair = c
                    }
                }
            }
            last = c
        }
        
        return gotPairs && gotStreak
    }
    
    func increment(_ p: inout String) {
        var newP: String = ""
        var going = true
        
        while newP.count < 8  {
            var next = p[7-newP.count]
            if going {
                if next == "z" {
                    next = "a"
                } else {
                    next = Character(UnicodeScalar(next.asciiValue!+1))
                    going = false
                }
            }
            newP.insert(next, at: newP.startIndex)
        }
        
        for (i, c) in newP.enumerated() {
            if c == "i" {
                newP = String(newP[0, i] + "j" + "aaaaaaa".first(7-i))
                break
            } else if c == "o" {
                newP = String(newP[0, i] + "p" + "aaaaaaa".first(7-i))
                break
            } else if c == "l" {
                newP = String(newP[0, i] + "m" + "aaaaaaa".first(7-i))
                break
            }
        }
        
        p = newP
    }
    
    var input = inputLines(11)[0]
    
    while !isValid(input) {
        increment(&input)
    }
    let a1 = input

    increment(&input)
    
    while !isValid(input) {
        increment(&input)
    }
    let a2 = input
    
    print(a1, a2)
}
