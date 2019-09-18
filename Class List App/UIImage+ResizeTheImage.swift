//
//  UIImage+ResizeTheImage.swift
//  csse337
//
//  Created by CS589 on 9/6/19.
//  Copyright © 2019 Monmouth University. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resizeTheImage (image: UIImage, newHeight: CGFloat) -> UIImage? {
        
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
