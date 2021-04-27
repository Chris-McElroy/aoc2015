//
//  day22.swift
//  aoc2015
//
//  Created by Chris McElroy on 4/19/21.
//

import Foundation

func day22() {
    struct Spell: Hashable, CustomStringConvertible {
        let mana: Int
        let damage: Int
        let heal: Int
        let newMana: Int
        let armor: Int
        let length: Int
        
        var description: String {
            switch mana {
            case 53: return "magic missile"
            case 73: return "drain"
            case 113: return "shield"
            case 173: return "poison"
            case 229: return "recharge"
            default: return " | "
            }
        }
    }
    
    struct Move {
        var options: [Spell]
        var spell: Spell { options.last! }
        let mana: Int
        let myHealth: Int
        let opHealth: Int
    }

    class GameTree: CustomStringConvertible {
        var tree: [Move] = []
        var path: [Spell] = []
        var active: [Spell] = []
        var mana: Int = 500
        var myHealth: Int = 50
        var opHealth: Int = 0
        var heal: Int = 0
        var newMana: Int = 0

        let opBaseDamage: Int
        var opDamage: Int = 0
        var myDamage: Int = 0
        
        var description: String {
            "\(myHealth) hp, \(active.map({ $0.armor }).sum()) armor, \(mana) mana, boss \(opHealth) hp"
        }

        init(opHealth: Int, opBaseDamage: Int) {
            self.opBaseDamage = opBaseDamage
            self.opDamage = opBaseDamage
            self.opHealth = opHealth
        }

        func addMove(options: [Spell]) {
            tree.append(Move(options: options, mana: mana, myHealth: myHealth, opHealth: opHealth))
            updateAll()
        }

        func nextOption() -> Bool {
            if !tree.last!.options.isEmpty { tree[tree.count-1].options.removeLast() }
            while tree.last!.options.isEmpty {
                tree.removeLast()
                if tree.isEmpty { return false }
                tree[tree.count-1].options.removeLast()
            }
            updateAll()
            return true
        }

        func updateAll() {
            path = tree.map({ $0.spell })
            active = path.enumerated().filter({ (i,s) in s.length >= (tree.count - i) }).map({ $0.element })
            opDamage = max(1, opBaseDamage - active.map({ $0.armor }).sum())
            myDamage = active.map({ $0.damage }).sum()
            heal = active.map({ $0.heal }).sum()
            newMana = active.map({ $0.newMana }).sum()

            mana = tree.last!.mana - path.last!.mana
            myHealth = tree.last!.myHealth
            opHealth = tree.last!.opHealth
        }
        
        func nextActive() -> [Spell] {
            return path.enumerated().filter({ (i,s) in s.length > (tree.count - i) }).map({ $0.element })
        }
    }
    
    let input = inputWords(22)
    let opHealthStart = Int(input[0][2])!
    let opBaseDamage = Int(input[1][1])!

    let spells: Set<Spell> = [
        Spell(mana: 53, damage: 4, heal: 0, newMana: 0, armor: 0, length: 1),
        Spell(mana: 73, damage: 2, heal: 2, newMana: 0, armor: 0, length: 1),
        Spell(mana: 113, damage: 0, heal: 0, newMana: 0, armor: 7, length: 6),
        Spell(mana: 173, damage: 3, heal: 0, newMana: 0, armor: 0, length: 6),
        Spell(mana: 229, damage: 0, heal: 0, newMana: 101, armor: 0, length: 5)
    ]
    
    let opOptions = [Spell(mana: 0, damage: 0, heal: 0, newMana: 0, armor: 0, length: 0)]

    var tree: GameTree = GameTree(opHealth: opHealthStart, opBaseDamage: opBaseDamage)
    
    func runSpells() {
        tree.opHealth -= tree.myDamage
        tree.myHealth += tree.heal
        tree.mana += tree.newMana
    }

    func playToEnd(min: Int, hard: Bool) -> Bool {
        if tree.path.last?.mana ?? 0 != 0 {
            runSpells()
            if tree.opHealth <= 0 { return true }
            
            tree.myHealth -= tree.opDamage
            tree.addMove(options: opOptions)
            if tree.myHealth <= 0 { return false }
        }
        while true {
            if hard {
                tree.myHealth -= 1
                if tree.myHealth <= 0 { return false }
            }
            runSpells()
            if tree.opHealth <= 0 { return true }
            
            let options = spells.subtracting(tree.nextActive()).filter({ $0.mana <= tree.mana })
            if options.isEmpty || tree.path.map({ $0.mana }).sum() >= min { return false }
            tree.addMove(options: Array(options))
            runSpells()
            if tree.opHealth <= 0 { return true }
            
            tree.myHealth -= tree.opDamage
            tree.addMove(options: opOptions)
            if tree.myHealth <= 0 { return false }
        }
    }

    var a1 = Int.max
    repeat {
        if playToEnd(min: a1, hard: false) {
            let spentMana = tree.path.map({ $0.mana }).sum()
            if spentMana < a1 { a1 = spentMana }
        }
    } while tree.nextOption()
    
    tree = GameTree(opHealth: opHealthStart, opBaseDamage: opBaseDamage)
    var a2 = Int.max
    repeat {
        if playToEnd(min: a2, hard: true) {
            let spentMana = tree.path.map({ $0.mana }).sum()
            if spentMana < a2 { a2 = spentMana }
        }
    } while tree.nextOption()
    
    print("22:", a1, a2)
}
// 1824 1937
