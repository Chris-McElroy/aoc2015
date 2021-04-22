//
//  day22.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/19/21.
//

import Foundation

func day22() {
//    let input = inputLines(22)
    let opHealthStart = 71
    let opDamage = 10
    
    let spells: Set<Spell> = [
        Spell(mana: 53, damage: 4, heal: 0, newMana: 0, armor: 0, length: 1),
        Spell(mana: 73, damage: 2, heal: 2, newMana: 0, armor: 0, length: 1),
        Spell(mana: 113, damage: 0, heal: 0, newMana: 0, armor: 7, length: 6),
        Spell(mana: 173, damage: 3, heal: 0, newMana: 0, armor: 0, length: 6),
        Spell(mana: 229, damage: 0, heal: 0, newMana: 101, armor: 0, length: 5)
    ]
    
    var activeSpells: Set<Spell> = []
    var tree: [[Spell]] = []
    var myMana = 500
    var myHealth = 50
    var myArmor = 0
    var opHealth = opHealthStart
    
    func runSpells() {
        for spell in activeSpells {
            opHealth -= spell.damage
            myHealth += spell.heal
            myMana += spell.newMana
            myArmor += spell.armor
        }
    }
    
    func tradeBlows() -> Bool? {
        myArmor = 0
        runSpells()
        if opHealth <= 0 { return true }
        
        myHealth -= max(opDamage - myArmor, 1)
        if myHealth <= 0 || myMana <= 0 { return false }
        
        runSpells()
        if opHealth <= 0 { return true }
        
        return nil
    }
    
    var a1 = Int.max
    
    while true {
        var outcome: Bool? = nil
        while outcome == nil {
            outcome = tradeBlows()
            activeSpells.removeAll()
            for (index, spell) in tree.map({ $0.last! }).enumerated() {
                if 2*(tree.count-index) < spell.length {
                    activeSpells.insert(spell)
                }
            }
            let options = spells.subtracting(activeSpells).filter({ $0.mana <= myMana })
            tree.append(Array(options).sorted(by: { $0.mana > $1.mana }))
            guard let newSpell = tree.last?.last else { outcome = false; break }
            myMana -= newSpell.mana
            activeSpells.insert(newSpell)
        }
        if outcome == true {
            let total = tree.map({ $0.last!.mana }).sum()
            if total < a1 { a1 = total }
            break
        } else {
            print(tree.map{ $0.map{ $0.mana }})
            if !tree.last!.isEmpty { tree[tree.count-1].removeLast() }
            while tree.last?.isEmpty == true {
                tree.removeLast()
                tree[tree.count-1].removeLast()
            }
        }
    }
    
    print(a1)
    
    struct Spell: Hashable {
        let mana: Int
        let damage: Int
        let heal: Int
        let newMana: Int
        let armor: Int
        let length: Int
    }
}

