//
//  AlphaNumCeasarCipher.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 2/27/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//

//In this cipher, the encrypt method will encript from alphanumeric to alphanumeric by shifting
//the characters using the number in the secret. It shifts the characters fowards. 

//The decrypt method, does the same but shifts backwards.

import Foundation


struct AlphaNumCeasarCipher: Cipher {
    func encrypt(_ plaintext: String, secret: String) -> String? {
        
        let alphaSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let alphaArray = Array(alphaSet)
        var encrypted = ""
        
        var inputText = plaintext.uppercased()
        inputText = inputText.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        
        let inputArray = Array(inputText)
        
        guard let offset = Int(secret) else {
            return "Secret must be an integer number for this cipher"
        }
        
        for msgIndex in 0..<inputArray.count{
            let position_ = alphaArray.index(of: inputArray[msgIndex])!
            encrypted = encrypted + String(alphaArray[(position_+offset)%alphaSet.count])
        }
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        let alphaSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let alphaArray = Array(alphaSet)
        var decrypted = ""
        
        var inputText = plaintext.uppercased()
        inputText = inputText.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        
        let inputArray = Array(inputText)
        
        guard let offset = Int(secret) else {
            return "Secret must be an integer number for this cipher"
        }
        
        for msgIndex in 0..<inputArray.count{
            var position_ = alphaArray.index(of: inputArray[msgIndex])!
            
            while (position_ - offset) < 0 { position_ += alphaArray.count}
            
            decrypted = decrypted + String(alphaArray[(position_ - offset)])
          
            
        }
        return decrypted
    }
    
    
    
    
    
    
}
