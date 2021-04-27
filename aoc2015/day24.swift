//
//  day24.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/21/21.
//

import Foundation

func day24() {
    let input = inputInts(24)
    let sum1 = input.sum()/3
    let sum2 = input.sum()/4
    var n = 1
    var a1: Int? = nil
    var a2: Int? = nil
    
    func dividable(_ packages: [Int], sum: Int) -> Bool {
        var m = 1
        while m <= packages.count/2 {
            let options = packages.uniqueCombinations(of: m)
            for group in options {
                if group.sum() == sum {
                    return true
                }
            }
            m += 1
        }
        return false
    }
    
    while a1 == nil || a2 == nil {
        let options = input.uniqueCombinations(of: n)
        if a1 == nil {
            for group in options.filter({ $0.sum() == sum1 }).sorted(by: { $0.product() < $1.product() }) {
                if dividable(input.filter({ !group.contains($0) }), sum: sum1) {
                    a1 = group.product()
                    break
                }
            }
        }
        if a2 == nil {
            for group in options.filter({ $0.sum() == sum2 }).sorted(by: { $0.product() < $1.product() }) {
                if dividable(input.filter({ !group.contains($0) }), sum: sum2) {
                    a2 = group.product()
                    break
                }
            }
        }
        
        n += 1
    }
    
    print("24:", a1!, a2!)
}
// 11846773891 80393059
