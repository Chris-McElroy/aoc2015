//
//  day04.swift
//  aoc2015
//
//  Created by Chris McElroy on 3/5/21.
//

import Foundation
import CryptoKit

func day04() {
    let input = inputLines(4)[0]
    
    let two0s: [UInt8] = [0,0]
    let three0s: [UInt8] = [0,0,0]
    
    var a1 = 1
    while a1 < 100000000 {
        let hash = Insecure.MD5.hash(data: (input+String(a1)).data(using: .utf8)!)

        if hash.starts(with: two0s) {
            // dropLast allows me to use subscripts
            if hash.dropLast()[2] < 16 { break }
        }
        
        a1 += 1
    }
    
    var a2 = a1+1
    while a2 < 100000000 {
        let hash = Insecure.MD5.hash(data: (input+String(a2)).data(using: .utf8)!)

        if hash.starts(with: three0s) { break }
        
        a2 += 1
    }

    print(a1, a2)
}
        
