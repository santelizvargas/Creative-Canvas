//
//  CanvasConstants.swift
//  DrawingApp
//
//  Created by Steven Santeliz on 1/6/24.
//

import SwiftUI

enum CanvasConstants {
    static let buttonSpacing: CGFloat = 12
    static let defaultLineSize: CGFloat = 5
    static let oneValue: Int = 1
    
    enum Slider {
        static let minValue: CGFloat = 1
        static let maxValue: CGFloat = 9
    }
    
    enum Shadow {
        static let opacity: CGFloat = 0.15
        static let radius: CGFloat = 10
        static let yPosition: CGFloat = 15
    }
    
    // MARK: - Drawing colors
    
    enum Drawing {
        static let colors: [Color] = [.red, .blue, .black, .orange, .green, .purple, .brown]
    }
    
    // MARK: - Button constants
    
    enum Button {
        static let size: CGFloat = 25
        static let lineWidth: CGFloat = 2
        
        enum ScaleEffect {
            static let min: CGFloat = 1
            static let max: CGFloat = 1.4
        }
        
        enum Opacity {
            static let min: CGFloat = 0
            static let max: CGFloat = 1
        }
        
        enum Animation {
            static let duration: CGFloat = 0.6
            static let extraBounce: CGFloat = 0.5
        }
    }
    
    enum Images: String {
        case back = "gobackward"
        case clear = "eraser.line.dashed.fill"
        case colorFill = "pencil.tip.crop.circle.fill"
        case color = "pencil.tip.crop.circle"
    }
}
