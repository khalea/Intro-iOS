//
//  SaveSketch.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/23/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import Foundation
import UIKit

class SaveSketch {
    
    let appDeleg = UIApplication.shared.delegate as! AppDelegate
    
    
    // Convert UIView with Sketch to UIImage for Thumbnail & Sharing to Social Media in the Future
    func toImage(_ view : UIView) -> UIImage {
        
        // Image renderer sets the size of the image to the UIView andsubsequently draws the lines of the sketch onto it (hopefully)
        // Context is the image data -- its contents that can be rendered
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: view.bounds.width, height: view.bounds.height))
        let sketch = renderer.image {
            context in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        print("Reached ToImage")
        
        return sketch
        
    }
    
    
    func writeImg(_ data : Data, url : URL) {
        
        print("Reached Write Image")
        
        do {
            try data.write(to: url.appendingPathComponent("\(appDeleg.sketchNumber).jpg"))
            appDeleg.sketchNumber = appDeleg.sketchNumber + 1
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
    }
    
    
}
