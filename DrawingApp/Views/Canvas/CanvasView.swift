//
//  CanvasView.swift
//  DrawingApp
//
//  Created by Steven Santeliz on 1/6/24.
//

import SwiftUI

struct CanvasView: View {
    @State private var lines: [Line] = []
    @State private var lineSize: CGFloat = Constants.defaultLineSize
    @State private var selectedColor: Color = .red
    
    private typealias Constants = CanvasConstants
    
    var body: some View {
        VStack {
            headerView
            
            Canvas { context, _ in
                addPath(for: context)
            }
            .gesture(
                DragGesture(minimumDistance: .zero, coordinateSpace: .local)
                    .onChanged { value in
                        drawLine(with: value)
                    }
            )
        }
    }
    
    // MARK: View Components // Header View
    
    private var headerView: some View {
        VStack {
            HStack(spacing: Constants.buttonSpacing) {
                ForEach(Constants.drawingColors, id: \.self) { color in
                    colorButton(color)
                }
                
                backButton
                clearButton
            }
            
            Slider(value: $lineSize,
                   in: Constants.Slider.minValue...Constants.Slider.maxValue)
                .tint(selectedColor)
                .padding()
        }
        .background {
            Color.white.shadow(
                color: .gray.opacity(Constants.Shadow.opacity),
                radius: Constants.Shadow.radius,
                y: Constants.Shadow.yPosition
            )
        }
    }
    
    // MARK: - Back Button
    
    private var backButton: some View {
        Button {
            guard lines.count > .zero else { return }
            lines.removeLast()
        } label: {
            customImage(.back).padding(.leading)
        }
    }
    
    // MARK: - Clear Button
    
    private var clearButton: some View {
        Button {
            lines = []
        } label: {
            customImage(.clear)
        }
    }
    
    // MARK: Color Button
    
    private func colorButton(_ color: Color) -> some View {
        Button {
            selectedColor = color
        } label: {
            customImage(selectedColor == color ? .colorFill : .color)
                .resizable()
                .frame(width: Constants.ColorButton.size, height: Constants.ColorButton.size)
                .foregroundStyle(color)
                .background {
                    Circle()
                        .strokeBorder(color, lineWidth: Constants.ColorButton.lineWidth)
                        .scaleEffect(selectedColor == color ? Constants.ColorButton.ScaleEffect.max : Constants.ColorButton.ScaleEffect.min)
                        .opacity(selectedColor == color ? Constants.ColorButton.Opacity.max : Constants.ColorButton.Opacity.min)
                        .animation(.bouncy(duration: Constants.ColorButton.Animation.duration,
                                           extraBounce: Constants.ColorButton.Animation.extraBounce),
                                   value: selectedColor)
                }
        }
    }
    
    private func customImage(_ name: Constants.Images) -> Image {
        Image(systemName: name.rawValue)
    }
    
    // MARK: - Functionality // Draw Line
    
    private func drawLine(with value: DragGesture.Value) {
        let position = value.location
        
        if value.translation == .zero {
            let newLine = Line(points: [position],
                               lineSize: lineSize,
                               color: selectedColor)
            lines.append(newLine)
        } else {
            lines[lines.count - Constants.oneValue].points.append(position)
        }
    }
    
    // MARK: - Add Path
    
    private func addPath(for context: GraphicsContext) {
        lines.forEach { line in
            var path = Path()
            path.addLines(line.points)
            
            let strokeStyle = StrokeStyle(lineWidth: line.lineSize,
                                          lineCap: .round,
                                          lineJoin: .round)
            
            context.stroke(path, with: .color(line.color), style: strokeStyle)
        }
    }
}
