//
//  day23.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/21/21.
//

import Foundation

func day23() {
    let input = inputWords(23)
    
    var a = 0
    var b = 0
    var line = 0
    
    func runLine() -> Bool {
        guard line >= 0 && line < input.count else { return false }
        
        let ins = input[line]
        line += 1
        
        switch ins[0] {
        case "hlf":
            if ins[1] == "a" { a = a/2 }
            else { b = b/2 }
        case "tpl":
            if ins[1] == "a" { a = a*3 }
            else { b = b*3 }
        case "inc":
            if ins[1] == "a" { a += 1 }
            else { b += 1 }
        case "jmp":
            line += Int(ins[1])! - 1
        case "jie":
            if ins[1] == "a," {
                if a.isEven { line += Int(ins[2])! - 1 }
            } else {
                if b.isEven { line += Int(ins[2])! - 1 }
            }
        case "jio":
            if ins[1] == "a," {
                if a == 1 { line += Int(ins[2])! - 1 }
            } else {
                if b == 1 { line += Int(ins[2])! - 1 }
            }
        default: return false
        }
        
        return true
    }
    
    while runLine() {}
    
    let a1 = b
    a = 1
    b = 0
    line = 0
    
    while runLine() {}
    
    let a2 = b
    
    print(a1, a2)
}
// 307 160
