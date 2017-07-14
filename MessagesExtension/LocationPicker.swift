//
//  LocationPicker.swift
//  EventMe
//
//  Created by Mark Wang on 7/14/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//

import Foundation
import LocationPicker

class LocationViewController: LocationPickerViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCurrentLocationButton = true
        currentLocationButtonBackground = .blue
        showCurrentLocationInitially = true
        mapType = .standard
        useCurrentLocationAsHint = true
        searchBarPlaceholder = "Where do you want to have your event?"
        searchHistoryLabel = "Previously searched"
//        nav
    }
    @IBAction func buttonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
