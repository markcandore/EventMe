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
    
    
    @IBOutlet weak var chooseTimeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datetime: UIDatePicker!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var ScrollView: UIScrollView!
    var scrollViewInsets = UIEdgeInsets.zero
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){_ in
            self.requestPresentationStyle(.expanded)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
                self.ScrollView.setContentOffset(CGPoint(x: 0, y: 90), animated: false)
                self.ScrollView.setContentOffset(CGPoint(x: 0, y: -100), animated: false)
            }
        }
        nameTextField.returnKeyType = .next
        locationTextField.returnKeyType = .done
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.nameTextField.delegate = self
        self.locationTextField.delegate = self
    }
    override func viewDidLayoutSubviews() {
        let scrollViewBound = ScrollView.bounds
        let contentViewBound = contentView.bounds
        scrollViewInsets.top = scrollViewBound.size.height/2
        scrollViewInsets.bottom = scrollViewInsets.top
        scrollViewInsets.bottom += 1
        ScrollView.contentInset = scrollViewInsets
    }
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    @IBAction func didTapChooseTime(_ sender: UIButton) {
        requestPresentationStyle(.expanded)
        sender.alpha = 0
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
        if presentationStyle == .expanded {
            chooseTimeButton.alpha = 0
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){_ in 
                self.ScrollView.isScrollEnabled = false
            }
            
        }
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
extension MessagesViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 4 {
            ScrollView.isScrollEnabled = true
            ScrollView.setContentOffset(CGPoint(x: 0, y: 90), animated: true)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){_ in 
                 self.ScrollView.isScrollEnabled = false
            }
           
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField.tag == 4 {
            ScrollView.isScrollEnabled = true
            ScrollView.setContentOffset(CGPoint(x: 0, y: -100), animated: true)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in 
                self.ScrollView.isScrollEnabled = false
            }
        }
    }
}
