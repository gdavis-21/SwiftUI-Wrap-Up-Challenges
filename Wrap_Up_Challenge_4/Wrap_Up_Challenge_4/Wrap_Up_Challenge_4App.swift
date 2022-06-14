//
//  Wrap_Up_Challenge_4App.swift
//  Wrap_Up_Challenge_4
//
//  Created by Grant Davis on 6/8/22.
//

import SwiftUI

@main
struct Wrap_Up_Challenge_4App: App {
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(LibraryViewModel())
        }
    }
}
