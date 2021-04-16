//
//  day19.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/9/21.
//

import Foundation

func day19() {
    var input = inputWords(19)
    
    var string = input.popLast()![0]
    input.removeLast()
    
    var reps: [String: String] = [:]
    var ways: Set<String> = []
    var ops: Set<String> = ["e"]
    var path: [(String, String, String, Int)] = [(string, "", "", 0)]
    var steps = 0

    for line in input {
        reps[line[2]] = line[0]
        for i in 0..<string.count {
            var slice = string.dropFirst(i)
            if slice.hasPrefix(line[0]) {
                slice.removeFirst(line[0].count)
                ways.insert(string.first(i) + line[2] + slice)
            }
        }
    }
    
//    while !ops.contains(string) {
//        var new: Set<String> = []
//        for s in ops {
//            for i in stride(from: 0, to: s.count, by: 1) {
//                let slice = s.dropFirst(i)
//                for r in reps {
//                    if slice.hasPrefix(r.key) {
//                        new.insert(String(string.first(i)) + r.value + slice.dropFirst(r.key.count))
//                    }
//                }
//            }
//        }
//        steps += 1
//        print(steps, new.count)
//        ops = new
//    }
    
    var notAllowed: (String, String)? = nil
    while path.last!.0 != "e" {
        let s = path.last!.0
        var max: (String, String, Int) = ("","", 0)
        for r in reps {
            if s.contains(r.key) && !(notAllowed?.0 == r.value && notAllowed?.1 == r.key) {
                if r.key.count - r.value.count > max.2 {
                    max = (r.value, r.key, r.key.count - r.value.count)
                }
            }
        }
        if max != ("","", 0) {
            for i in stride(from: 0, to: string.count, by: 1) {
                let slice = s.dropFirst(i)
                if slice.hasPrefix(max.1) {
                    path.append((String(s.first(i)) + max.0 + String(slice.dropFirst(max.1.count)), max.0, max.1, max.2))
                    break
                }
            }
//            print(path.last!, path.count)
            notAllowed = nil
        } else {
            print("out of ideas", path.last!, path.count)
            notAllowed = (path.last!.1, path.last!.2)
            path.removeLast()
        }
    }

    
    print(ways.count, path.count)
    
    
}
