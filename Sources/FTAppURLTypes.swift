//
//  FTAppURLTypes.swift
//  cdef
//
//  Created by François Levaux on 14.11.16.
//  Copyright © 2016 François Levaux. All rights reserved.
//

import Cocoa

//        <key>CFBundleURLTypes</key>
//        <array>
//                <dict>
//                        <key>CFBundleURLName</key>
//                        <string>Email Address URL</string>
//                        <key>CFBundleURLSchemes</key>
//                        <array>
//                                <string>mailto</string>
//                        </array>
//                        <key>LSIsAppleDefaultForScheme</key>
//                        <true/>
//                </dict>
//        </array>


class FTAppURLTypes: NSObject {
    
    let URLName: String?
    let appleDefault: Bool?
    let URLSchemes: [String]?
    
    override var debugDescription: String {
        if let URLName = URLName, let URLSchemes = URLSchemes {
            return "\(URLName) => \(URLSchemes)"
        }
        
        return ""
    }
    
    init?(URLTypes: Dictionary<String,Any>) {
        self.URLName = URLTypes["CFBundleURLName"] as? String
        self.appleDefault = URLTypes["LSIsAppleDefaultForScheme"] as? Bool
        self.URLSchemes = URLTypes["CFBundleURLSchemes"] as? [String]
        
        if self.URLSchemes == nil {
            return nil
        }
    }
}
