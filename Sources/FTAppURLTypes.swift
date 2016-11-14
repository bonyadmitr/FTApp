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


public class FTAppURLTypes: NSObject {
    
    public let URLName: String?
    public let appleDefault: Bool?
    public let URLSchemes: [String]?
    
    public override var debugDescription: String {
        if let URLName = URLName, let URLSchemes = URLSchemes {
            return "\(URLName) => \(URLSchemes)"
        }
        
        return ""
    }
    
    public init?(URLTypes: Dictionary<String,Any>) {
        self.URLName = URLTypes["CFBundleURLName"] as? String
        self.appleDefault = URLTypes["LSIsAppleDefaultForScheme"] as? Bool
        self.URLSchemes = URLTypes["CFBundleURLSchemes"] as? [String]
        
        if self.URLSchemes == nil {
            return nil
        }
    }
}
