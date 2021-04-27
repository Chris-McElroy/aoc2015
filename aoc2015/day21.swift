//
//  day21.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/15/21.
//

import Foundation

func day21() {
    let input = inputWords(21)
    let myHealth = 100
    let opHealth = Int(input[0][2])!
    let opDamage = Int(input[1][1])!
    let opArmor = Int(input[2][1])!
        
    struct Item: Hashable {
        let cost: Int
        let damage: Int
        let armor: Int
    }
    
    let weapons: Set<Item> = [
        Item(cost: 8, damage: 4, armor: 0),
        Item(cost: 10, damage: 5, armor: 0),
        Item(cost: 25, damage: 6, armor: 0),
        Item(cost: 40, damage: 7, armor: 0),
        Item(cost: 74, damage: 8, armor: 0)
    ]
    
    let armor: Set<Item> = [
        Item(cost: 13, damage: 0, armor: 1),
        Item(cost: 31, damage: 0, armor: 2),
        Item(cost: 53, damage: 0, armor: 3),
        Item(cost: 75, damage: 0, armor: 4),
        Item(cost: 102, damage: 0, armor: 5),
        Item(cost: 0, damage: 0, armor: 0)
    ]
    
    let rings: Set<Item> = [
        Item(cost: 25, damage: 1, armor: 0),
        Item(cost: 50, damage: 2, armor: 0),
        Item(cost: 100, damage: 3, armor: 0),
        Item(cost: 20, damage: 0, armor: 1),
        Item(cost: 40, damage: 0, armor: 2),
        Item(cost: 80, damage: 0, armor: 3),
        Item(cost: 0, damage: 0, armor: 0)
    ]
    
    var a1 = Int.max
    var a2 = 0
    
    for weapon in weapons {
        for armor in armor {
            for ring1 in rings {
                for ring2 in rings where ring2 != ring1 || ring1.cost == 0 {
                    let myPower = max(weapon.damage + armor.damage + ring1.damage + ring2.damage - opArmor, 1)
                    let opPower = max(opDamage - weapon.armor - armor.armor - ring1.armor - ring2.armor, 1)
                    let cost = weapon.cost + armor.cost + ring1.cost + ring2.cost
                    let myTurns = opHealth/myPower
                    let opTurns = myHealth/opPower
                    
                    if opTurns > myTurns || (opTurns == myTurns && myHealth != opTurns*opPower) {
                        if cost < a1 { a1 = cost }
                    } else {
                        if cost > a2 { a2 = cost }
                    }
                }
            }
        }
    }
    
    print("21:", a1, a2)
}
// 121 201
