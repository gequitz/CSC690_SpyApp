//
//  VigenereCipher.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 3/3/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//


// The secret is duplicated or trimmed until it has the same length as the message.
// Then every character of the message is shifted by the character of the secret that shares the same index.
// For example: A secret of abc, will shift the first three characters of the message by
// 1, 2, and 3 characters.

import Foundation

struct VigenereCipher: Cipher{
    func encrypt(_ plaintext: String, secret: String) -> String? {
        let alphaSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWYZ1234567890"
        let alphaArray = Array(alphaSet)
        
        var encrypted = ""
        let msgArray = Array(plaintext) //transform message in an array of characters
        let secretArray = Array(secret) //transform secret in an array of characters
        
        //loop through the characters of the message array
        for msgIndex in 0..<msgArray.count{
            
            guard let position1 = alphaArray.index(of: msgArray[msgIndex]) else {
                return "Error: Input string must alphanumeric characters"
            }
            
            
            
            guard let position2 = alphaArray.index(of: secretArray[msgIndex%secretArray.count]) else {
                return "Error: Secret must be alphanumeric characters"
            }
            encrypted = encrypted + String(alphaArray[position1 + position2%alphaArray.count])
           
        }
        return encrypted
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        let alphaSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWYZ1234567890"
        let alphaArray = Array(alphaSet)
        
        var decrypted = ""
        let msgArray = Array(plaintext) //transform message in an array of characters
        let secretArray = Array(secret) //transform secret in an array of characters
        
        //loop through the characters of the message array
        for msgIndex in 0..<msgArray.count{
            guard let position1 = alphaArray.index(of: msgArray[msgIndex]) else {
                return "Input string must be alphanumeric characters"
            }
            guard let position2 = alphaArray.index(of: secretArray[msgIndex%secretArray.count]) else {
                return "Error: secret must be alphanumeric characters "
            }
            if((position1 - position2%alphaArray.count) >= 0 ){
              decrypted = decrypted + String(alphaArray[position1 - position2%alphaArray.count])
            }
            else{
             //
            
                return "Error: input or secret not properly set up for decrypting."
              
            }
            
            
        }
        return decrypted
    }
    
    
    
}
