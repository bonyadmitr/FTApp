//
//  FTApplication.swift
//  MacAdminQuitApp
//
//  Created by François Levaux on 20.09.16.
//  Copyright © 2016 François Levaux. All rights reserved.
//
import Cocoa

public protocol FTApplicationProtocol {
    func isRunning() -> Bool
    func terminate(force forceQuit: Bool)
}
