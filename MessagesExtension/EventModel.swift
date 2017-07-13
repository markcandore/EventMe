//
//  eventModel.swift
//  EventMe
//
//  Created by Mark Wang on 7/10/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//

import Foundation
import UIKit
import Messages
class Event {
    var name : String
    var date: String
    var time: String
    var location : String
    var image: UIImage
    
    init(name: String, date: String, time: String, location: String, emojiString: String) {
        self.name = name
        self.date = date
        self.time = time
        self.location = location
        self.image = emojiString.image()
    }
}
extension String {
    func image() -> UIImage {
        let size = CGSize(width: 30, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.black.set()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
