//
//  AppDelegate.swift
//  SearchMenuBarExample
//
//  Created by Kevin Gutowski on 12/22/20.
//

import Cocoa
import AppKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    var item: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        item?.button?.image = NSImage(named: "Cat")
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

extension NSStatusBarButton {

    public override func mouseDown(with event: NSEvent) {
        
        NSApp.activate(ignoringOtherApps: true)
        
        self.highlight(true)
        let menu = SMBMenu(with: self)
        
        DispatchQueue.main.async {
            menu.popUp(positioning: menu.item(at: 0), at:NSMakePoint(self.frame.minX, self.frame.maxY+4), in: self)
        }
    }
}
