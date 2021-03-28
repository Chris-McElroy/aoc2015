//
//  day12.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/24/21.
//

import Foundation

func day12() {
    // thanks to quikling for the beautiful method
    
    func getSum(_ e: Any) -> Int {
        if let n = e as? Int {
            return n
        } else if let d = e as? [String: Any] {
            return d.values.map { getSum($0) }.sum()
        } else if let a = e as? [Any] {
            return a.map { getSum($0) }.sum()
        }
        return 0
    }
    
    func getRedSum(_ e: Any) -> Int {
        if let n = e as? Int {
            return n
        } else if let d = e as? [String: Any] {
            let hasRed = d.values.contains { $0 as? String ?? "" == "red" }
            return hasRed ? 0 : d.values.map { getRedSum($0) }.sum()
        } else if let a = e as? [Any] {
            return a.map { getRedSum($0) }.sum()
        }
        return 0
    }
    
    let input = inputLines(12)[0].data(using: .utf8)
    let data = try! JSONSerialization.jsonObject(with: input!)
    
    let a1 = getSum(data)
    let a2 = getRedSum(data)
    
    print(a1, a2)
}
// 111754 65402
