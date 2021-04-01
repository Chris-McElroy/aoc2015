//
//  day09.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/17/21.
//

import Foundation

func day09() {
    let input = inputWords(9)
    
    var names: [String] = []
    var graph: [[String]: Int] = [:]
    
    for line in input {
        if !names.contains(line[0]) { names.append(line[0]) }
        if !names.contains(line[2]) { names.append(line[2]) }
        
        graph[[line[0],line[2]]] = Int(line[4])!
        graph[[line[2],line[0]]] = Int(line[4])!
    }
    
    var paths: [[String]] = []
    permutations(len: names.count, &names, output: &paths)

    var a1 = Int.max
    var a2 = Int.min

    for path in paths {
        var dist = 0
        var valid = true
        
        for i in stride(from: 1, to: path.count, by: 1) {
            guard let d = graph[[path[i], path[i-1]]] else {
                valid = false
                break
            }
            dist += d
        }

        if valid {
            if dist < a1 { a1 = dist }
            if dist > a2 { a2 = dist }
        }
    }
    
    print(a1, a2)
}

// 251 898
