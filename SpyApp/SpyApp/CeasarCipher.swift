//
//  CeasarCipher.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 2/24/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//

import Foundation

protocol Cipher{
    func encrypt(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}

struct CeasarCipher: Cipher{
    func encrypt(_ plaintext: String, secret: String) -> String? {
        
        guard let offset = UInt32(secret) else {
           // return nil
            return "Error: secret must be an integer number for this cipher."
        }
        
        var encrypted = ""
        
        for char in plaintext{
            let unicode = char.unicodeScalars.first!.value
            let shiftedUnicode = unicode + offset
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encrypted = encrypted + shiftedCharacter
        }
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let offset = UInt32(secret) else {
            //return nil
            return "Error: secret must be an integer number for this cipher."
        }
        
        var decrypted = ""
        
        for char in plaintext{
            let unicode = char.unicodeScalars.first!.value
            let shiftedUnicode = unicode - offset
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
    
    
    
}









