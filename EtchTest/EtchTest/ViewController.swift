//
//  ViewController.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/18/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let drawingBoard = Drawing()
    
    @IBAction func upButton(_ sender: Any) {
        
        // Decrease y by 1
        // Add CGPoint to last [CGPoint] in drawingBoard.lines array
        let x = drawingBoard.lastLinePoint().x
        let y = drawingBoard.lastLinePoint().y - 1
        let point = CGPoint(x: x, y: y)
        
        drawingBoard.appendPt(point)
        print("Moved Up - X: \(drawingBoard.lines.last?.last?.x ?? 0) Y: \(drawingBoard.lines.last?.last?.y ?? 0)")
        
        // TODO Create alert for all buttons in the case that the user hasn't tapped a starteing point yet
        
        drawingBoard.setNeedsDisplay()
    }
    
    @IBAction func downButton(_ sender: Any) {
        
        // Increase y by 1
        // Add CGPoint to last [CGPoint] in drawingBoard.lines array
        let x = drawingBoard.lastLinePoint().x
        let y = drawingBoard.lastLinePoint().y + 1
        let point = CGPoint(x: x, y: y)
        
        drawingBoard.appendPt(point)
        print("Moved Down - X: \(drawingBoard.lines.last?.last?.x ?? 0) Y: \(drawingBoard.lines.last?.last?.y ?? 0)")
        
        drawingBoard.setNeedsDisplay()
    }
    
    
    @IBAction func leftButton(_ sender: Any) {
        
        // Decrease x by 1
        // Add CGPoint to last [CGPoint] in drawingBoard.lines array
        let x = drawingBoard.lastLinePoint().x - 1
        let y = drawingBoard.lastLinePoint().y
        let point = CGPoint(x: x, y: y)
        
        drawingBoard.appendPt(point)
        print("Moved Left - X: \(drawingBoard.lines.last?.last?.x ?? 0) Y: \(drawingBoard.lines.last?.last?.y ?? 0)")
        
        drawingBoard.setNeedsDisplay()
    }
    
    
    @IBAction func rightButton(_ sender: Any) {
        
        // Increase x by 1
        // Add CGPoint to last [CGPoint] in drawingBoard.lines array
        let x = drawingBoard.lastLinePoint().x + 1
        let y = drawingBoard.lastLinePoint().y
        let point = CGPoint(x: x, y: y)
        
        drawingBoard.appendPt(point)
        print("Moved Right - X: \(drawingBoard.lines.last?.last?.x ?? 0) Y: \(drawingBoard.lines.last?.last?.y ?? 0)")
        
        drawingBoard.setNeedsDisplay()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(drawingBoard);
        drawingBoard.frame = CGRect(x: 0, y: 44, width: 450, height: 675)
        drawingBoard.backgroundColor = .gray;
        
    }


}

