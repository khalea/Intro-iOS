//
//  Drawing.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/18/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import Foundation
import UIKit

class Drawing : UIView {
    
    //// TODO: Keep track of individual colors of strokes //// 
    
    
    ///// "Pen" Position & Lines //////
    // Current position of the "pen"
    var currentPosn : CGPoint = CGPoint(x: 0, y: 0)
    // Array of lines --> A line is an array of CGPoints, operates somewhat like a stack
    var lines : [[CGPoint]] = [[CGPoint]]()
    
    
    ////// Pen Tool Settings /////
    
    // Colors taken from slider values in Settings -- default black
    var red : CGFloat = 0.0 // Red
    var green : CGFloat = 0.0 // Green
    var blue : CGFloat = 0.0 // Blue
    var opacity : CGFloat = 1.0 // Alpha
    
    
    // Line Width Variable from Settings
    
    
    //////////// Getters & Setters for Lines Array ////////////
    
    // Retrieve last line in lines array
    func lastLine() -> [CGPoint]? {
        
        guard let lastLn = lines.last else {return nil}
        
        return lastLn
        
    }
    
    // Retreives last point in the last line of the array
    func lastLinePoint() -> CGPoint {
        
        guard let lastPt = lastLine()?.last else {return CGPoint(x: 0, y: 0)}
        
        return lastPt
        
    }
    
    // Append point to last line in array of lines
    func appendPt(_ pt : CGPoint){
        
        if lines.isEmpty {
            
            print("Error appending point: array of points empty. Tap the screen")
            
        } else {
            
            lines[lines.count-1].append(pt)
            
        }
    }
    
    ///// Getters & Setters for Pen Tools /////
    
    func setRed(_ red : CGFloat) {
        
        self.red = red
        print("Red changed!")
        
    }
    
    func setGreen(_ green : CGFloat) {
        
        self.green = green
        
    }
    
    func setBlue(_ blue : CGFloat) {
        
        self.blue = blue
        
    }
    
    func setOpacity(_ opacity : CGFloat) {
        
        self.opacity = opacity
        
    }
    
    
    //////////// Draw Onto the UIView ////////////
    
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        // Context gives info on where to draw, colors to use, etc
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Use points in array for drawing
        
        // For every point in the array, move to the point in order to draw it
        lines.forEach { (line) in
            
            for (i, p) in line.enumerated() {
                if i == 0 { // Move to point p if its the first point
                    context.move(to: p)
                } else { // Else
                    context.addLine(to: p)
                }
            }
            
        }
        
        // HLine settings
        context.setStrokeColor(red: self.red, green: self.green, blue: self.blue, alpha: self.opacity) // Color
        context.setLineWidth(10); // Width
        context.setLineCap(.round); // Shape of stroke
        context.strokePath()
        
        
    }
    
    // Tap spot for first point in line
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //
        guard let startingPt : CGPoint = touches.first?.location(in: self) else {return}
        
        currentPosn = startingPt
        // Append array including the starting point to the array of lines
        lines.append([startingPt])
        
        print("Current Position - X: \(startingPt.x) Y: \(startingPt.y) ")
        
    }
    
    ///// Clear Drawing Board /////
    
    func clearBoard() {
        
        if lines.isEmpty == false {
            self.lines.removeAll()
        } else {
            
            // TODO Display popup saying that the board is already empty!
            print("Board is already clear!")
            
        }
        
        
    }
    
    
    
}
