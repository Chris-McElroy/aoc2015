//
//  day07.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/12/21.
//

import Foundation

func day07() {
    func assign(_ ins: [Substring]) {
        let wire = stack.last!
        
        if let n = UInt16(ins[0]) {
            wireDict[wire] = n
            stack.removeLast()
        } else {
            if let n = wireDict[ins[0]] {
                wireDict[wire] = n
                stack.removeLast()
            } else {
                stack.append(ins[0])
            }
        }
    }
    
    func invert(_ ins: [Substring]) {
        let wire = stack.last!
        
        if let n = wireDict[ins[1]] {
            wireDict[wire] = ~n
            stack.removeLast()
        } else {
            stack.append(ins[1])
        }
    }
    
    func combine(_ ins: [Substring]) {
        let wire = stack.last!
        var n1: UInt16? = nil
        var n2: UInt16? = nil
        
        if let n = UInt16(ins[0]) { n1 = n }
        else if let n = wireDict[ins[0]] { n1 = n }
        else { stack.append(ins[0]) }
        
        if let n = UInt16(ins[2]) { n2 = n }
        else if let n = wireDict[ins[2]] { n2 = n }
        else { stack.append(ins[2]) }
        
        if n1 != nil && n2 != nil {
            switch(ins[1]) {
            case "AND": wireDict[wire] = n1! & n2!
            case "OR": wireDict[wire] = n1! | n2!
            case "LSHIFT": wireDict[wire] = n1! << n2!
            case "RSHIFT": wireDict[wire] = n1! >> n2!
            default: break
            }
            stack.removeLast()
        }
    }
    
    func solve(_ instr: [Substring: [Substring]], for w: Substring) -> UInt16 {
        wireDict = [:]
        stack = [w]
        
        while !stack.isEmpty {
            while wireDict[stack.last!] != nil {
                stack.removeLast()
                if stack.isEmpty { break }
            }
            
            let left = instr[stack.last!]!
            if left.count == 2 {
                assign(left)
            } else if left[0] == "NOT" {
                invert(left)
            } else {
                combine(left)
            }
        }
        
        return wireDict[w]!
    }
    
    let input = inputLines(7).map { $0.split(separator: " ") }
    var instr = input.reduce(into: [Substring: [Substring]]()) { $0[$1.last!] = $1.dropLast() }
    var wireDict: [Substring: UInt16] = [:]
    var stack: [Substring] = []
    
    let a1 = solve(instr, for: "a")
    instr["b"] = ["\(a1)","->"]
    let a2 = solve(instr, for: "a")
    
    print("07:", a1, a2)
}
