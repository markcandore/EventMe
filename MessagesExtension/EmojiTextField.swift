//
//  EmojiTextField.swift
//  EventMe
//
//  Created by Nathan Baker on 7/12/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//

import UIKit

class EmojiTextField: UITextField {
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
