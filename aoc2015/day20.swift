//
//  day20.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/15/21.
//

import Foundation

func day20() {
    func deliver10(_ i: Int) -> Int {
        let di = Double(i)
        let s = Int(sqrt(Double(i)))
        var sum = 0
        for j in stride(from: 1, through: s, by: 1) {
            if di/Double(j) == Double(i/j) {
                sum += j + i/j
            }
        }
        if s*s == i { sum += s }
        return sum*10
    }
    
    func deliver11(_ i: Int) -> Int {
        let di = Double(i)
        let s = Int(sqrt(Double(i)))
        var sum = 0
        for j in stride(from: 1, through: s, by: 1) {
            if di/Double(j) == Double(i/j) {
                if i < j*50 { sum += j }
                if j < 50 { sum += i/j }
            }
        }
        // ignoring since i > 2500
        // if s*s == i && i < s*50 { sum += s }
        return sum*11
    }
    
    let input = inputInts(20)[0]
    
    var a1 = 0
    while deliver10(a1) < input {
        a1 += 120
        // adding 120 is sus but should work if you don't get super unlucky
        // if you get the wrong answer reduce to 1 or 6 or 12, it'll just take 10x longer
    }
    
    var a2 = 0
    while deliver11(a2) < input {
        a2 += 120
    }
    
    print(a1, a2)
}
// 831600 884520
