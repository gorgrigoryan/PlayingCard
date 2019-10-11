//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by 1 on 9/10/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import CoreGraphics
import Foundation

struct PlayingCard : CustomStringConvertible {
    var description: String {
        return "\(rank)\(suit)"
    }
    
    enum Suit : String, CustomStringConvertible {
        var description: String {
            return rawValue
        }
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    
    enum Rank : CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(.numeric(pips))
            }
            
            allRanks += [.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
    
    var suit: Suit
    var rank: Rank
}
