//
//  FTAppBundle.swift
//  FTApp
//
//  Created by François Levaux on 15.11.16.
//
//

import Cocoa

class FTAppBundle: FTApplicationProtocol {
    
    public let bundleID: String
    
    
    public init(bundleID: String) {
        self.bundleID = bundleID
    }
    
    public func isRunning() -> Bool {
        for runningApplication in NSWorkspace.shared().runningApplications {
            if let runningApplicationBundleID = runningApplication.bundleIdentifier {
                if runningApplicationBundleID.contains(self.bundleID) {
                    return true
                }
            }
        }
        
        return false
    }
    
    public func terminate(force forceQuit: Bool = false) {
        for runningApplication in NSWorkspace.shared().runningApplications {
            if let runningApplicationBundleID = runningApplication.bundleIdentifier {
                if runningApplicationBundleID.contains(self.bundleID) {
                    
                    if forceQuit {
                        print("Terminating \(runningApplicationBundleID)")
                        runningApplication.forceTerminate()
                    } else {
                        print("Quitting \(runningApplicationBundleID)")
                        runningApplication.terminate()
                    }
                }
            }
        }
    }
    
}
