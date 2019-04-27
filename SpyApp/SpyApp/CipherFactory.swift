//
//  CipherFactory.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 2/23/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//

import Foundation

struct CipherFactory{
    private var ciphers: [String: Cipher] = [
        
        "Ceasar": CeasarCipher(),
       
        "Alphanumeric": AlphaNumCeasarCipher(),
        
        "Morse" : MorseCipher(),
        
        "Vigenere": VigenereCipher(),
    ]
    
    func cipher(for key: String) -> Cipher{
        return ciphers[key]!
    }
}
