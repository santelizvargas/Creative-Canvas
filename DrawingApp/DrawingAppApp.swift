//
//  DrawingAppApp.swift
//  DrawingApp
//
//  Created by Steven Santeliz on 16/5/24.
//

import SwiftUI

@main
struct DrawingAppApp: App {
    var body: some Scene {
        WindowGroup {
            CanvasView()
                .preferredColorScheme(.light)
        }
    }
}
