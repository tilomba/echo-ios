//
//  NATODictionary.swift
//  Echo
//
//  Created by Damon Jones on 4/18/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import Foundation

class NATODictionary {

    static let dictionary = [
        "A": "ALPHA",
        "B": "BRAVO",
        "C": "CHARLIE",
        "D": "DELTA",
        "E": "ECHO",
        "F": "FOXTROT",
        "G": "GOLF",
        "H": "HOTEL",
        "I": "INDIA",
        "J": "JULIET",
        "K": "KILO",
        "L": "LIMA",
        "M": "MIKE",
        "N": "NOVEMBER",
        "O": "OSCAR",
        "P": "PAPA",
        "Q": "QUEBEC",
        "R": "ROMEO",
        "S": "SIERRA",
        "T": "TANGO",
        "U": "UNIFORM",
        "V": "VICTOR",
        "W": "WHISKEY",
        "X": "X-RAY",
        "Y": "YANKEE",
        "Z": "ZULU",
        "0": "ZERO",
        "1": "ONE",
        "2": "TWO",
        "3": "THREE",
        "4": "FOUR",
        "5": "FIVE",
        "6": "SIX",
        "7": "SEVEN",
        "8": "EIGHT",
        "9": "NINE"
    ]
    
    static func translateString(string: String) -> [String] {
        var tokens = [String]()
        
        for character in string.uppercaseString {
            if let translatedCharacter = dictionary[String(character)] {
                tokens.append(translatedCharacter)
            }
        }
        
        return tokens
    }
}
