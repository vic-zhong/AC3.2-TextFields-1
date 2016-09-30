//
//  File.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

internal extension UITextField {
    
    internal var debugId: String {
        
        if self.accessibilityLabel != nil && self.accessibilityLabel != "" {
            return self.accessibilityLabel! + " (UITextField)"
        }
        else if self.text != nil && self.text != "" {
            return self.text! + " (UITextField)"
        }
        else if self.placeholder != nil && self.placeholder != "" {
            return self.placeholder! + " (UITextField)"
        }
        else {
            return "\(self.hashValue) (UITextField)"
        }
    }
    
}
