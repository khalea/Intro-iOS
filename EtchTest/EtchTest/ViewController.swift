//
//  ViewController.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/18/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDeleg = UIApplication.shared.delegate as! AppDelegate
    
    var drawingView : UIView?
    
    var saveFolder : URL?
    
    
    
    //// Save Sketch - Save UIView as Image and Save to Local Storage ////
    /// Refer to lecture 15
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBAction func saveSketch(_ sender: Any) {
        
        let fm = FileManager()
        
        // Get url for /Documents folder
        let docDirectoryURL = try! fm.url(for: .documentDirectory,
                                          in: .userDomainMask,
                                          appropriateFor: nil,
                                          create: true)
        // print("Document Directory: \(docDirectoryURL)")
        
        // URL of the folder to save sketches in
        let etchFolder = docDirectoryURL.appendingPathComponent("EtchySketch",
                                                                     isDirectory: true)
        // print("Etch Folder: \(etchFolder)")
        
        // Check if the folder exists
        let folderExists = fm.fileExists(atPath: etchFolder.absoluteString)
        
        // Create folder if it doesn't exist, otherwise just add the file to the folder
        if folderExists == false {
            
            do {
                // Create the folder
                try fm.createDirectory(at: etchFolder,
                                       withIntermediateDirectories: true,
                                       attributes: nil)
                // Set class variable for save folder
                self.saveFolder = etchFolder
                
                // Save sketch to folder
                
                // Save a sketch to the folder
                let save = SaveSketch()
                
                let sketch = save.toImage(drawingView!)
                
                let imageData = sketch.jpegData(compressionQuality: 1.0)
                
                save.writeImg(imageData!, url: etchFolder)
                
            } catch {
                
                print("Error trying to create folder.")
                
            }
            
        } else {
            
            let fm = FileManager()
            
            // Get url for /Documents folder
            let docDirectoryURL = try! fm.url(for: .documentDirectory,
                                              in: .userDomainMask,
                                              appropriateFor: nil,
                                              create: true)
            
            // URL of the folder to save sketches in
            let etchFolder = docDirectoryURL.appendingPathComponent("EtchySketch",
                                                                    isDirectory: true)
            
            print("Folder: \(etchFolder.absoluteString)")
            
            // Save a sketch to the folder
            let save = SaveSketch()
            
            let sketch = save.toImage(drawingView!)
            
            let imageData = sketch.jpegData(compressionQuality: 1.0)
            
            save.writeImg(imageData!, url: etchFolder)
            
            
        }
        
        
        
    }
    
    ///// Directional Buttons /////
    
    @IBAction func upButton(_ sender: Any) {
        
        let drawingBoard = appDeleg.drawingBoard
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
        
        let drawingBoard = appDeleg.drawingBoard
        
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
        
        let drawingBoard = appDeleg.drawingBoard
        
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
        
        let drawingBoard = appDeleg.drawingBoard
        
        // Increase x by 1
        // Add CGPoint to last [CGPoint] in drawingBoard.lines array
        let x = drawingBoard.lastLinePoint().x + 1
        let y = drawingBoard.lastLinePoint().y
        let point = CGPoint(x: x, y: y)
        
        drawingBoard.appendPt(point)
        print("Moved Right - X: \(drawingBoard.lines.last?.last?.x ?? 0) Y: \(drawingBoard.lines.last?.last?.y ?? 0)")
        
        drawingBoard.setNeedsDisplay()
        
    }
    
    ///// Shake Gesture Handling /////
    
    // Clear board by clearing array of lines in DrawingBoard
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        let drawingBoard = appDeleg.drawingBoard
        
        if motion == .motionShake {
            print("Shaking detected!")
            // Clear board and refresh the drawingBoard subview
            drawingBoard.clearBoard()
            drawingBoard.setNeedsDisplay()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let drawingBoard = appDeleg.drawingBoard
        
        view.addSubview(drawingBoard);
        drawingBoard.frame = CGRect(x: 0, y: 44, width: 450, height: 675)
        drawingBoard.backgroundColor = .gray;
        (drawingBoard.superview)!.sendSubviewToBack(drawingBoard)
        
        drawingView = drawingBoard
        
    }


}



