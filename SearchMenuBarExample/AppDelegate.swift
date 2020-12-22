//
//  AppDelegate.swift
//  SearchMenuBarExample
//
//  Created by Kevin Gutowski on 12/22/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    var item: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        item?.button?.image = NSImage(named: "Cat")
        
        let search = NSTextField()
        search.frame = NSMakeRect(0, 0, 180, 24)
        search.placeholderString = "Search..."
        let searchMenu = NSMenuItem()
        searchMenu.view = search
        
        let menu = NSMenu()
        menu.addItem(searchMenu)
        menu.addItem(.separator())
        menu.addItem(NSMenuItem(title: "Item 1", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Item 2", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Item 3", action: #selector(AppDelegate.copyCode), keyEquivalent: ""))
        menu.addItem(.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.quit), keyEquivalent: ""))
        menu.minimumWidth = 200
        
        item?.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func copyCode() {
        // TODO: Copy gist code to clipboard
        print("Item clicked")
    }
    
    @objc func quit() {
        NSApp.terminate(self)
    }
}

