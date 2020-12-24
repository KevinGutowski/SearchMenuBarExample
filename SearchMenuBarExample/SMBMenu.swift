//
//  SMBMenu.swift
//  SearchMenuBarExample
//
//  Created by Kevin Gutowski on 12/24/20.
//

import Cocoa

class SMBMenu: NSMenu {
    
    var button: NSStatusBarButton?
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(title: String) {
        super.init(title: title)
    }
    
    init(with button:NSStatusBarButton) {
        super.init(title: "")
        
        self.button = button
        
        let search = NSTextField()
        search.frame = NSMakeRect(0, 0, 180, 24)
        search.placeholderString = "Search..."
        let searchMenu = NSMenuItem()
        searchMenu.view = search
        
        self.addItem(searchMenu)
        self.addItem(.separator())
        self.addItem(NSMenuItem(title: "Item 1", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        self.addItem(NSMenuItem(title: "Item 2", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        self.addItem(NSMenuItem(title: "Item 3", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        self.addItem(.separator())
        self.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.quit), keyEquivalent: ""))
        self.minimumWidth = 200
    }
    
    deinit {
        button?.highlight(false)
    }
}
