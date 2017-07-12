//
//  eventModel.swift
//  EventMe
//
//  Created by Mark Wang on 7/10/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//

import Foundation

class Event {
    var name : String?
    var time : Date?
    var location : String?
    
    init(name: String?, date: Date, location: String?){
        self.name = name
        self.time = date
        self.location = location
    }
}
