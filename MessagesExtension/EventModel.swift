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
    var name : String?
    var date: String?
    var time: String?
    var location : String?
    var image: UIImage?
    
    init(name: String, date: String, time: String, location: String, emojiString: String) {
        self.name = name
        self.date = date
        self.time = time
        self.location = location
        self.image = emojiString.image()
    }
    
    init(message: MSMessage){
        
    
        
        if let url = message.url {
            if let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                if let queryItems = urlComponents.queryItems {
                    var params = [String: String]()
                    
                    queryItems.forEach {
                        params[$0.name] = $0.value
                    }
                    
                    self.name = params["name"]
                    self.location = params["location"]
                    self.date = params["date"]
                    self.time = params["time"]
                    self.image = params["emoji"]?.image()
                }
            }
//            url.encoded
//            self.name = getQueryStringParameter(url: String(describing: url), param: "name")
//            self.location = getQueryStringParameter(url: String(describing: url), param: "location")
//            self.time = getQueryStringParameter(url: String(describing: url), param: "time")
//            self.date = getQueryStringParameter(url: String(describing: url), param: "date")
//            let emoji = getQueryStringParameter(url: String(describing: url), param: "emoji")
//            self.image = emoji.image()
            
        }
    }
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
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
