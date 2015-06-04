//
//  NATODictionary.swift
//  Echo
//
//  Created by Damon Jones on 4/18/15.
//  Copyright (c) 2015 Cosmic Labs. All rights reserved.
//

import Foundation

public class NATODictionary {
    private static let dictionary = [
        "A": "Alpha",
        "B": "Bravo",
        "C": "Charlie",
        "D": "Delta",
        "E": "Echo",
        "F": "Foxtrot",
        "G": "Golf",
        "H": "Hotel",
        "I": "India",
        "J": "Juliet",
        "K": "Kilo",
        "L": "Lima",
        "M": "Mike",
        "N": "November",
        "O": "Oscar",
        "P": "Papa",
        "Q": "Quebec",
        "R": "Romeo",
        "S": "Sierra",
        "T": "Tango",
        "U": "Uniform",
        "V": "Victor",
        "W": "Whiskey",
        "X": "Xray",
        "Y": "Yankee",
        "Z": "Zulu",
        "0": "Zero",
        "1": "One",
        "2": "Two",
        "3": "Three",
        "4": "Four",
        "5": "Five",
        "6": "Six",
        "7": "Seven",
        "8": "Eight",
        "9": "Nine"
    ]
    
    static internal func translateString(string: String) -> TokenList {
        var tokens = TokenList()
        
        for character in string.uppercaseString {
            if let translatedCharacter = dictionary[String(character)] {
                if let token = Token(rawValue: translatedCharacter) {
                    tokens.append(token)
                }
            }
        }
        
        return tokens
    }
}
