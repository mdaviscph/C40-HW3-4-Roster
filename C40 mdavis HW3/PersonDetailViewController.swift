//
//  PersonDetailViewController.swift
//  C40 mdavis HW3, HW4
//
//  Created by mike davis on 6/11/15.
//  Copyright (c) 2015 mike davis. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {


  @IBOutlet weak var firstName: UILabel!
  @IBOutlet weak var lastName: UILabel!
  @IBOutlet weak var emailAddress: UITextField!
  
  var person: Person!
  var rosterIndex = -1
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    if (rosterIndex >= 0) {
      firstName.text = person.firstName
      lastName.text = person.lastName
      if let emailString = person.emailAddress {
        emailAddress.text = emailString
      }
    }
  }
 
  @IBAction func emailAddressEditingDidEnd(sender: AnyObject) {
    person.emailAddress = emailAddress.text
    println("email address edit: \(emailAddress.text)")
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    startObservingKeyboardEvents()
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    stopObservingKeyboardEvents()
  }
  
  // keyboard may overlap the text field
  func startObservingKeyboardEvents() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("keyboardWillShow:"),
        name:UIKeyboardWillShowNotification, object:nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector:Selector("keyboardWillHide:"),
        name:UIKeyboardWillHideNotification, object:nil)
  }
  
  func stopObservingKeyboardEvents() {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
  }
  
  // adjust scroll view so keyboard doesn't overlap
  func keyboardWillShow(notification: NSNotification) {
    if let userInfo = notification.userInfo {
      if let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
        let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
        for subView in view.subviews {
          if let sub = subView as? UIScrollView {
            println("kWS contentInset: \(descriptionEdgeInsets(sub.contentInset))")
            println("change to: \(descriptionEdgeInsets(contentInset))")
            sub.contentInset = contentInset
          }
        }
      }
    }
  }
  func descriptionEdgeInsets(ei: UIEdgeInsets) -> String {
    return "top:\(Int(ei.top)) left:\(Int(ei.left)) bottom:\(Int(ei.bottom)) right:\(Int(ei.right))"
  }
  
  func keyboardWillHide(notification: NSNotification) {
    for subView in view.subviews {
      if let sub = subView as? UIScrollView {
        sub.contentInset = UIEdgeInsetsZero
      }
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
