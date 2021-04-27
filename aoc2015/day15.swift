//
//  day15.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/31/21.
//

import Foundation

func day15() {
    var a1 = 0
    var a2 = 0
    let input = inputWords(15)
    
    let caps = input.map { Int($0[2].dropLast())! }
    let durs = input.map { Int($0[4].dropLast())! }
    let flavs = input.map { Int($0[6].dropLast())! }
    let texts = input.map { Int($0[8].dropLast())! }
    let cals = input.map { Int($0[10])! }
    
    for i in stride(from: 0, through: 100, by: 1) {
        for j in stride(from: 0, through: 100-i, by: 1) {
            for k in stride(from: 0, through: 100-i-j, by: 1) {
                let l = 100-i-j-k
                
                let cap = caps[0]*i+caps[1]*j+caps[2]*k+caps[3]*l
                let dur = durs[0]*i+durs[1]*j+durs[2]*k+durs[3]*l
                let flav = flavs[0]*i+flavs[1]*j+flavs[2]*k+flavs[3]*l
                let text = texts[0]*i+texts[1]*j+texts[2]*k+texts[3]*l
                let cal = cals[0]*i+cals[1]*j+cals[2]*k+cals[3]*l
            
                if cap > 0 && dur > 0 && flav > 0 && text > 0 {
                    let tot = cap*dur*flav*text
                    if tot > a1 { a1 = tot }
                    if cal == 500 && tot > a2 { a2 = tot }
                }
            }
        }
    }
    
    print("15:", a1, a2)
}
// 13882464 11171160
