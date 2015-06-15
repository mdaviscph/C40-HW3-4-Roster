//
//  Person.swift
//  C40 mdavis HW3
//
//  Created by mike davis on 6/11/15.
//  Copyright (c) 2015 mike davis. All rights reserved.
//

import Foundation

class Person {
  var lastName: String
  var firstName: String
  var emailAddress: String?
  
  init(lastName: String, firstName: String, emailAddress: String?) {
    self.lastName = lastName
    self.firstName = firstName
    self.emailAddress = emailAddress
  }
  convenience init(lastName: String, firstName: String) {
    self.init(lastName: lastName, firstName: firstName, emailAddress: nil)
  }

}