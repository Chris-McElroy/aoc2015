//
//  day16.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/2/21.
//

import Foundation

func day16() {
    let input = inputLines(16)
    let sues: [Sue] = input.map { Sue(from: $0) }
    
    let og = Sue(from: "Sue 0: children: 3, cats: 7, samoyeds: 2, pomeranians: 3, akitas: 0, vizslas: 0, goldfish: 5, trees: 3, cars: 2, perfumes: 1")
    
    var a1 = 0
    var a2 = 0
    
    for sue in sues {
        let valid1 = og.info == og.info.merging(sue.info, uniquingKeysWith: { $1 })
        var valid2 = og.info == og.info.merging(sue.info.filter { !$0.key.isin(["cats","trees","pomeranians","goldfish"]) }, uniquingKeysWith: { $1 })
        let _ = og.info.merging(sue.info.filter { $0.key.isin(["cats","trees"]) }, uniquingKeysWith: {
            if !($1 > $0) { valid2 = false }
            return $0
        })
        let _ = og.info.merging(sue.info.filter { $0.key.isin(["pomeranians","goldfish"]) }, uniquingKeysWith: {
            if !($1 < $0) { valid2 = false }
            return $0
        })

        if valid1 { a1 = sue.ID }
        if valid2 { a2 = sue.ID }
    }
    
    print("16:", a1, a2)
    
    struct Sue {
        let ID: Int
        var info: [Substring: Int] = [:]

        init(from info: String) {
            let divInfo = info.split(separator: ":")
            ID = Int(divInfo[0].split(separator: " ")[1])!

            for i in 1..<(divInfo.count-1) {
                let n = Int(divInfo[i+1].split(separator: " ")[0].split(separator: ",")[0])!
                self.info[divInfo[i].split(separator: " ").last!] = n
            }
        }
    }
}
