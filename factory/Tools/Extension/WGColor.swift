//
//  WGColor.swift
//  factory
//
//  Created by Qing Chen on 2018/5/14.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import Foundation
extension UIColor {
    class func colorWithHexString(stringToConvert: String)->(UIColor){
        var cString = (stringToConvert as NSString).trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines
        ).uppercased()
        if cString.count < 6 {
            return UIColor.white;
        }
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1);
        }
        if cString.count != 6 {
            return UIColor.white;
        }
        
        var range = NSRange();
        range.location = 0;
        range.length = 2;
        
        let rStr = (cString as NSString).substring(with: range);
        range.location = 2;
        let gStr = (cString as NSString).substring(with: range);
        range.location = 4;
        let bStr = (cString as NSString).substring(with: range);
        
        var r: CUnsignedInt = 0;
        var g: CUnsignedInt = 0;
        var b: CUnsignedInt = 0;
        Scanner(string: rStr).scanHexInt32(&r);
        Scanner(string: gStr).scanHexInt32(&g);
        Scanner(string: bStr).scanHexInt32(&b);
        return UIColor(red: CGFloat(r) / 255.0, green:CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }
    
    public var image: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(cgColor)
        context?.fill(rect)
        let image = context?.makeImage()
        UIGraphicsEndImageContext()
        return UIImage(cgImage: image!)
    }
}
