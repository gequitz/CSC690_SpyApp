//
//  MorseCipher.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 2/26/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//


// In this cipher the encrypt method will encript a message from alphanumeric to the Morse code
// The decrypt method does the opposite.

//encript method: takes in Alphanumerica characters and translate to Morse Code


import Foundation

struct MorseCipher: Cipher{
    
    func encrypt(_ plaintext: String, secret: String) -> String? {
        
        
        
        
        
        //dictionary of alphanumeric characters to Morse symbols
        
        let alphaNumericToMorse: Dictionary<String, String> = [
            
            "A": ".-",
            "B": "-...",
            "C": "-.-.",
            "D": "-..",
            "E": ".",
            "F": "..-.",
            "G": "--.",
            "H": "....",
            "I": "..",
            "J": ".---",
            "K": "-.-",
            "L": ".-..",
            "M": "--",
            "N": "-.",
            "O": "---",
            "P": ".--.",
            "Q": "--.-",
            "R": ".-.",
            "S": "...",
            "T": "-",
            "U": "..-",
            "V": "...-",
            "W": ".--",
            "X": "-..-",
            "Y": "-.--",
            "Z": "--..",
            "0": "-----",
            "1": ".----",
            "2": "..---",
            "3": "...--",
            "4": "....-",
            "5": ".....",
            "6": "-....",
            "7": "--...",
            "8": "---..",
            "9": "----."
            
            
        ]
        
        var encrypted = ""
        
        //convert input  text to uppercase
        let input = plaintext.uppercased()
        
        
        //loop through the input
        for char in input{
            
            //find Morse code for the character
            let morseCode = alphaNumericToMorse[String(char)]
            
            //append morse code to the input and add a space
            encrypted = encrypted + morseCode! + " "
        }
        
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        
        
        //build dictionary of Morse to Alphanumeric symbols
        
        let morseToAlphaNumeric: Dictionary<String, String> = [
            
            ".-"    : "A",
            "-..."  : "B",
            "-.-."  : "C",
            "-.."   : "D",
            "."     : "E",
            "..-."  : "F",
            "--."   : "G",
            "...."  : "H",
            ".."    : "I",
            ".---"  : "J",
            "-.-"   : "K",
            ".-.."  : "L",
            "--"    : "M",
            "-."    : "N",
            "---"   : "O",
            ".--."  : "P",
            "--.-"  : "Q",
            ".-."   : "R",
            "..."   : "S",
            "-"     : "T",
            "..-"   : "U",
            "...-"  : "V",
            ".--"   : "W",
            "-..-"  : "X",
            "-.--"  : "Y",
            "--.."  : "Z",
            "-----" : "0",
            ".----" : "1",
            "..---" : "2",
            "...--" : "3",
            "....-" : "4",
            "....." : "5",
            "-...." : "6",
            "--..." : "7",
            "---.." : "8",
            "----." : "9"
            
            
        ]
        
        for char in plaintext{
            //return an error if input does not consists only of periods, dashes or blank characters
            if (char != "." && char != "-" && char != " "){
                return "Error: Input must contain contain only dashes, periods or blank characters"
            }
        }
        
        
        //use " " as a delimiter to split the input text
        let codesArray = plaintext.components(separatedBy: " ")
        
        var decrypted = ""
        
        //loop through the  Morse code
        for code in codesArray{
            //return an error if input is not a valid Morse code
            guard let converted = morseToAlphaNumeric[code] else {
                return "Invalid Morse Code Entered"
            }
            
            decrypted = decrypted + converted
        }
        
        
        
        
        return decrypted
    }
    
    
    
    
    
}
