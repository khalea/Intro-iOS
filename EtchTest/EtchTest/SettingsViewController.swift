//
//  SettingsViewController.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/22/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController {
    
    // Drawing Reference
    let appDeleg = UIApplication.shared.delegate as! AppDelegate
    
    
    // Default Color Values
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    var opacity : CGFloat = 1.0
    
    
    // Slider Outlets for Setting Value on Load
    @IBOutlet weak var redSliderVal: UISlider!
    @IBOutlet weak var greenSliderVal: UISlider!
    @IBOutlet weak var blueSliderVal: UISlider!
    @IBOutlet weak var opacitySliderVal: UISlider!
    
    
    // UILabel Live Displaying Color
    @IBOutlet weak var colorDisplayLabel: UILabel!
    
    // Sliders to Adjust Color Values
    /// TODO Use setters to set pen color in Drawing.Swift ///
    
    @IBAction func redSlider(_ sender: UISlider) {
        
        // Set red to slider value
        red = CGFloat(sender.value)
        
        // Set red in drawing handler
        let drawingBoard = appDeleg.drawingBoard
        drawingBoard.setRed(self.red)
    
        print("Red: \(sender.value)")
        
        // Change UILabel color
        colorDisplayLabel.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.opacity)
        
     }
    
    
    @IBAction func greenSlider(_ sender: UISlider) {
        // Set green to slider value
        green = CGFloat(sender.value)
        
        // Set green in drawing handler
        let drawingBoard = appDeleg.drawingBoard
        drawingBoard.setGreen(self.green)
        
        print("Green: \(sender.value)")
        
        colorDisplayLabel.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.opacity)
    }
    
    
    @IBAction func blueSlider(_ sender: UISlider) {
        // Set blue to slider value
        blue = CGFloat(sender.value)
        
        // Set blue in drawing handler
        let drawingBoard = appDeleg.drawingBoard
        drawingBoard.setBlue(self.blue)
        
        
        print("Blue: \(sender.value)")
        
        colorDisplayLabel.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.opacity)
    }
    
    
    @IBAction func opacitySlider(_ sender: UISlider) {
        // Set opacity to slider value
        opacity = CGFloat(sender.value)
        
        // Set opacity in drawing handler
        let drawingBoard = appDeleg.drawingBoard
        drawingBoard.setOpacity(self.opacity)
        
        print("Opacity: \(sender.value)")
        
        colorDisplayLabel.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: self.opacity)
    }
    
    override func viewDidLoad() {
        
        let drawingBoard = appDeleg.drawingBoard
        
        colorDisplayLabel.backgroundColor = UIColor(red: drawingBoard.red, green: drawingBoard.green, blue: drawingBoard.blue, alpha: drawingBoard.opacity)
        
        redSliderVal.value = Float(drawingBoard.red)
        greenSliderVal.value = Float(drawingBoard.green)
        blueSliderVal.value = Float(drawingBoard.blue)
        opacitySliderVal.value = Float(drawingBoard.opacity)
        
        
    }
    
    
    
}
