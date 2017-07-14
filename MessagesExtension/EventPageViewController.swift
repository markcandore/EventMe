//
//  EventPageViewController.swift
//  EventMe
//
//  Created by Nathan Baker on 7/12/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//

import UIKit
import Messages

class EventPageViewController: UIViewController {
    var event: Event?
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventEmoji: UIImageView!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = event?.name
        eventLocationLabel.text = event?.location
        eventEmoji.image = event?.image
//        eventTimeLabel.text = event.date! + event.time!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
