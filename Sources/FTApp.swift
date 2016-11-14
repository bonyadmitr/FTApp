//
//  FTApp.swift
//
//  Created by François 'ftiff' Levaux-Tiffreau on 20.09.16.
//  Copyright © 2016 François Levaux-Tiffreau. All rights reserved.
//

import Cocoa

public class FTApp: FTApplicationProtocol {
    
    public let path: String
    public let bundle: Bundle
    
    public enum error: Error {
        case CannotGetBundle
    }
    
    public init(path: String) throws {
        self.path = path
        
        guard let bundle = Bundle.init(path: path) else {
            throw(error.CannotGetBundle)
        }
        
        self.bundle = bundle
    }
    
    
    
    // ----------------------------------------------------------------------------------------
    // icon -> NSImage
    // ----------------------------------------------------------------------------------------
    
    public lazy var icon: NSImage = {
        if var iconFilename = self.bundle.infoDictionary?["CFBundleIconFile"] as? String {
            if iconFilename.hasSuffix(".icns") {
                iconFilename = (iconFilename as NSString).deletingPathExtension
            }
            if let iconFile = self.bundle.path(forResource: iconFilename, ofType: "icns") {
                if let icon = NSImage(byReferencingFile: iconFile) {
                    return icon
                }
            }
        }
        return NSImage(imageLiteralResourceName: "NSApplicationIcon")
    }()
    
    
    
    
    // ----------------------------------------------------------------------------------------
    // name -> String
    // ----------------------------------------------------------------------------------------
    
    public lazy var name: String = {
        if let appName = self.bundle.localizedInfoDictionary?["CFBundleExecutable"] as? String {
            return appName
        }
        if let appName = self.bundle.infoDictionary?["CFBundleExecutable"] as? String {
            return appName
        }
        
        return "Error"
    }()
    
    // ----------------------------------------------------------------------------------------
    // documentTypes -> [FTAppDocumentTypes]
    // ----------------------------------------------------------------------------------------
    
    public lazy var documentTypes: [FTAppDocumentTypes?] = {
        var result = [FTAppDocumentTypes?]()
        if let documentTypesArray = self.bundle.infoDictionary?["CFBundleDocumentTypes"] as? [Dictionary<String, Any>] {
            for documentTypeElement in documentTypesArray {
                if let documentTypeObject = FTAppDocumentTypes(documentTypes: documentTypeElement) {
                    result.append(documentTypeObject)
                }
            }
            return result
        }
        return []
    }()
    
    // ----------------------------------------------------------------------------------------
    // URLTypes -> [FTAppURLTypes]
    // ----------------------------------------------------------------------------------------
    
    public lazy var URLTypes: [FTAppURLTypes?] = {
        var result = [FTAppURLTypes?]()
        if let URLTypesArray = self.bundle.infoDictionary?["CFBundleURLTypes"] as? [Dictionary<String, Any>] {
            for URLTypeElement in URLTypesArray {
                if let URLTypeObject = FTAppURLTypes(URLTypes: URLTypeElement) {
                    result.append(URLTypeObject)
                }
            }
            return result
        }
        return []
    }()
    
    
    // ----------------------------------------------------------------------------------------
    // isRunning -> Bool
    // ----------------------------------------------------------------------------------------
    
    public func isRunning() -> Bool {
        for runningApplication in NSWorkspace.shared().runningApplications {
            if runningApplication.localizedName == self.name {
                return true
            }
        }
        
        return false
    }
    
    
    
    // ----------------------------------------------------------------------------------------
    // terminate(force: Bool)
    // ----------------------------------------------------------------------------------------
    
    public func terminate(force forceQuit: Bool = false) {
        for runningApplication in NSWorkspace.shared().runningApplications {
            if let runningApplicationLocalizedName = runningApplication.localizedName {
                if runningApplicationLocalizedName == self.name {
                    
                    if forceQuit {
                        print("Terminating \(runningApplicationLocalizedName)")
                        runningApplication.forceTerminate()
                    } else {
                        print("Quitting \(runningApplicationLocalizedName)")
                        runningApplication.terminate()
                    }
                }
            }
            
        }
    }
}
