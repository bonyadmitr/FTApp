//
//  FTAppDocumentTypes.swift
//  cdef
//
//  Created by François Levaux on 14.11.16.
//  Copyright © 2016 François Levaux. All rights reserved.
//

//<key>CFBundleDocumentTypes</key>
//<array>
//  <dict>
//  <key>CFBundleTypeIconFile</key>
//  <string>document.icns</string>
//  <key>CFBundleTypeName</key>
//  <string>Email Message</string>
//  <key>CFBundleTypeRole</key>
//  <string>Viewer</string>
//  <key>LSIsAppleDefaultForType</key>
//  <true/>
//  <key>LSItemContentTypes</key>
//  <array>
//      <string>com.apple.mail.email</string>
//  </array>
//  </dict>
//</array>

import Cocoa

class FTAppDocumentTypes: NSObject {

    let iconFile: String?
    let typeName: String?
    let typeRole: String?
    let appleDefault: Bool?
    let contentTypes: [String]?
    
    override var debugDescription: String {
        if let typeName = typeName, let contentTypes = contentTypes {
            return "\(typeName) => \(contentTypes)"
        }
        
        return ""
    }
    
    init?(documentTypes: Dictionary<String,Any>) {
        self.iconFile = documentTypes["CFBundleTypeIconFile"] as? String
        self.typeName = documentTypes["CFBundleTypeName"] as? String
        self.typeRole = documentTypes["CFBundleTypeRole"] as? String
        self.appleDefault = documentTypes["LSIsAppleDefaultForType"] as? Bool
        self.contentTypes = documentTypes["LSItemContentTypes"] as? [String]
        
        if self.contentTypes == nil {
            return nil
        }
    }
}
