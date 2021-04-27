//
//  day25.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/26/21.
//

import Foundation

func day25() {
    let input = inputWords(25)[0]
    let row = Int(input[input.count-3].dropLast())!
    let col = Int(input[input.count-1].dropLast())!
    let num = col+(row+col-2)*(row+col-1)/2
    
    var a1 = 20151125
    for _ in stride(from: 1, to: num, by: 1) {
        a1 = a1*252533 % 33554393
    }
    
    print("25:", a1, "see above")
}
// 9132360
