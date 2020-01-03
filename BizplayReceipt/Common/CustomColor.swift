//
//  CustomColor.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class CustomColor: UIColor {

}

extension UIColor {
    
    //Convert to RGB with alpha
    public convenience init?(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) {
        self.init(red:r/255.0,green: g/255.0,blue: b/255.0,alpha: alpha)
        return
    }
    //Convert to Hex
    public convenience init?(hexString:String){
        let hexString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner            = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 62.0 / 255.0, green: 68.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var battleshipGrey: UIColor {
        return UIColor(red: 114.0 / 255.0, green: 117.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var orangeyRed: UIColor {
        return UIColor(red: 1.0, green: 63.0 / 255.0, blue: 52.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greyish: UIColor {
        return UIColor(white: 164.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var dodgerBlue: UIColor {
        return UIColor(red: 66.0 / 255.0, green: 134.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var twilightBlue: UIColor {
        return UIColor(red: 12.0 / 255.0, green: 65.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightPeriwinkle: UIColor {
      return UIColor(red: 223.0 / 255.0, green: 226.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightGreyBlue: UIColor {
      return UIColor(red: 176.0 / 255.0, green: 178.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightSkyBlue: UIColor {
      return UIColor(red: 223.0 / 255.0, green: 226.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var lightBlueGrey: UIColor {
      return UIColor(red: 198.0 / 255.0, green: 201.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }
}
