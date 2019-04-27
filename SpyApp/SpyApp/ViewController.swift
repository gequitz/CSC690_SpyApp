//
//  ViewController.swift
//  SpyApp
//
//  Created by Gabriel Equitz on 2/23/19.
//  Copyright © 2019 Gabriel Equitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    
    
    @IBOutlet weak var secret: UITextField!
    
    
    @IBOutlet weak var output: UILabel!
    
    
    let factory = CipherFactory()
    var cipher: Cipher?
    
    var inputText: String {
        if let text = input.text{
            return text
        } else{
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text{
            return text
        } else{
            return ""
        }
    }
    
    
    @IBAction func cipherBottonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
        
    }
    

    @IBAction func encryptButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else{
            output.text = "No cipher selected"
            return
        }
        if let encrypted = cipher.encrypt(inputText, secret: secretText){
            output.text = encrypted
        } else {
            output.text = "Error Encrypting"
        }
        
    }
    

    @IBAction func decryptBottonPressed(_ sender: UIButton) {
        
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        
        if let decrypted = cipher.decrypt(inputText, secret: secretText) {
            output.text = decrypted
        } else {
            output.text = "Error decrypting"
        }
    }
    
}

