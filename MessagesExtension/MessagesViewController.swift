//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Mark Wang on 7/10/17.
//  Copyright © 2017 Nathan and Mark. All rights reserved.
//
import Foundation
import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datetime: UIDatePicker!
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
//            self.requestPresentationStyle(.expanded)
//        }
//        // Do any additional setup after loading the view.
        
        formatDatePicker()
    }
    func formatDatePicker() {
        datetime.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    @IBAction func didTapCreateButton(_ sender: UIButton) {
        let name = nameTextField.text
        let date = datetime.date
        let location = locationTextField.text
        
        let event = Event(name: name, date: date, location: location)
        
        let layout = MSMessageTemplateLayout()

        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "E, MMM d"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        

        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        timeFormatter.dateFormat = "h:mm a"
        timeFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        layout.caption = event.name!
        layout.subcaption = dateFormatter.string(from: event.time!)
        layout.trailingCaption = event.location!
        layout.trailingSubcaption = timeFormatter.string(from: event.time!)
        
        
        //print(dateFormatter.string(from: event.time!))

        //layout.trailingCaption = event.time?.description
        //layout.trailingCaption = String(describing: event.time?.description!)
        
        
        let conversation = activeConversation
        
        let message = MSMessage()
        message.layout = layout
        
        conversation?.insert(message, completionHandler: nil)
        self.requestPresentationStyle(.compact)
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
//            self.requestPresentationStyle(.expanded)
//        }
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        super.willBecomeActive(with: conversation)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in 
            self.requestPresentationStyle(.expanded)
        }
        formatDatePicker()
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
//        if self.presentationStyle == .compact {
//            self.requestPresentationStyle(.expanded)
//        }
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
