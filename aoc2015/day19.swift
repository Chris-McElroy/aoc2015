//
//  day19.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/9/21.
//

import Foundation

func day19() {
    var input = inputWords(19)
    
    let string = input.popLast()![0]
    input.removeLast()
    
    var reps: [String: (String, Int)] = [:]
    var ways: Set<String> = []
    var path: [(String, [(String, String, Int)]?)] = [(string, nil)]
    var fails: Set<String> = []

    for line in input {
        reps[line[2]] = (line[0], line[2].count - line[0].count)
        for i in 0..<string.count {
            let slice = string.dropFirst(i)
            if slice.hasPrefix(line[0]) {
                ways.insert(String(string.first(i)) + line[2] + String(slice.dropFirst(line[0].count)))
            }
        }
    }
    
    while path.last!.0 != "e" {
        let s = path[path.count-1].0
        if path[path.count-1].1 == nil {
            path[path.count-1].1 = []
            for i in stride(from: 0, to: string.count, by: 1) {
                let slice = s.dropFirst(i)
                for r in reps {
                    if slice.hasPrefix(r.key) {
                        path[path.count-1].1?.append((r.key, r.value.0, i))
                    }
                }
            }
        }
        if path[path.count-1].1!.isEmpty {
            fails.insert(path.popLast()!.0)
        } else {
            let r = path[path.count-1].1!.popLast()!
            let slice = s.dropFirst(r.2)
            path.append((String(s.first(r.2)) + r.1 + String(slice.dropFirst(r.0.count)),nil))
        }
    }
    
    let a1 = ways.count
    let a2 = path.count-1
    print("19:", a1, a2)
}
// 509 195
