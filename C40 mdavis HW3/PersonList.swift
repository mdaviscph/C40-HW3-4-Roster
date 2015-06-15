//
//  PersonList.swift
//  C40 mdavis HW3
//
//  Created by mike davis on 6/11/15.
//  Copyright (c) 2015 mike davis. All rights reserved.
//

import Foundation

class PersonList {
  var people =
  [
    Person(lastName: "Juneau", firstName: "Sophia"),
    Person(lastName: "Phoenix", firstName: "Emma"),
    Person(lastName: "Little", firstName: "Olivia"),
    Person(lastName: "Sacramento", firstName: "Isabella"),
    Person(lastName: "Denver", firstName: "Mia"),
    Person(lastName: "Hartford", firstName: "Ava"),
    Person(lastName: "Dover", firstName: "Lily"),
    Person(lastName: "Tallahassee", firstName: "Zoe"),
    Person(lastName: "Atlanta", firstName: "Emily"),
    Person(lastName: "Honolulu", firstName: "Chloe"),
    Person(lastName: "Boise", firstName: "Layla"),
    Person(lastName: "Springfield", firstName: "Madison"),
    Person(lastName: "Indianapolis", firstName: "Madelyn"),
    Person(lastName: "Moines", firstName: "Abigail"),
    Person(lastName: "Topeka", firstName: "Aubrey"),
    Person(lastName: "Frankfort", firstName: "Charlotte"),
    Person(lastName: "Rouge", firstName: "Amelia"),
    Person(lastName: "Augusta", firstName: "Ella"),
    Person(lastName: "Annapolis", firstName: "Kaylee"),
    Person(lastName: "Boston", firstName: "Avery"),
    Person(lastName: "Lansing", firstName: "Aaliyah"),
    Person(lastName: "Paul", firstName: "Hailey"),
    Person(lastName: "Jackson", firstName: "Hannah"),
    Person(lastName: "Jefferson", firstName: "Addison"),
    Person(lastName: "Helena", firstName: "Riley"),
    Person(lastName: "Lincoln", firstName: "Jackson"),
    Person(lastName: "Carson", firstName: "Aiden"),
    Person(lastName: "Concord", firstName: "Liam"),
    Person(lastName: "Trenton", firstName: "Lucas"),
    Person(lastName: "Santa Fe", firstName: "Noah"),
    Person(lastName: "Albany", firstName: "Mason"),
    Person(lastName: "Raleigh", firstName: "Jayden"),
    Person(lastName: "Bismarck", firstName: "Ethan"),
    Person(lastName: "Columbus", firstName: "Jacob"),
    Person(lastName: "Oklahoma", firstName: "Jack"),
    Person(lastName: "Salem", firstName: "Caden"),
    Person(lastName: "Harrisburg", firstName: "Logan"),
    Person(lastName: "Providence", firstName: "Benjamin"),
    Person(lastName: "Columbia", firstName: "Michael"),
    Person(lastName: "Pierre", firstName: "Caleb"),
    Person(lastName: "Nashville", firstName: "Ryan"),
    Person(lastName: "Austin", firstName: "Alexander"),
    Person(lastName: "Salt", firstName: "Elijah"),
    Person(lastName: "Montpelier", firstName: "James"),
    Person(lastName: "Richmond", firstName: "William"),
    Person(lastName: "Olympia", firstName: "Oliver"),
    Person(lastName: "Charleston", firstName: "Connor"),
    Person(lastName: "Madison", firstName: "Matthew"),
    Person(lastName: "Cheyenne", firstName: "Daniel")
  ]
  
  func getCount() -> Int {
    return people.count
  }
  func isValidIndex(personIdx: Int) -> Bool {
    if personIdx >= 0 && personIdx < people.count {
      return true
    }
    return false
  }
  func getName(personIdx: Int) -> (last: String, first: String)? {
    if isValidIndex(personIdx) {
      let person = people[personIdx]
      return (person.lastName, person.firstName)
    }
    return nil
  }
  func getEmailAddress(personIdx: Int) -> String? {
    if isValidIndex(personIdx) {
      return people[personIdx].emailAddress
    }
    return nil
  }
  func getAtIndex(personIdx: Int) -> Person? {
    if isValidIndex(personIdx) {
      return people[personIdx]
    }
    else {
      return nil
    }
  }
  func removeAtIndex(personIdx: Int) -> (last: String, first: String)? {
    if isValidIndex(personIdx) {
      let person = people.removeAtIndex(personIdx)
      println("deleting \(person.firstName) \(person.lastName) at index: \(personIdx)")
      return (person.lastName, person.firstName)
    }
    else {
      return nil
    }
  }
  func moveAtIndexToDestinationIndex(personIdx: Int, destinationPersonIdx: Int) -> Bool {
    
    if isValidIndex(personIdx) && isValidIndex(destinationPersonIdx) &&
        personIdx != destinationPersonIdx {
      
      let tempPerson = people[personIdx]
      var moveIdx = personIdx
          
      println("moving \(tempPerson.firstName) \(tempPerson.lastName) index: \(personIdx) to \(destinationPersonIdx)")
  
      while (moveIdx < destinationPersonIdx) {
        people[moveIdx] = people[++moveIdx]
      }
      while (moveIdx > destinationPersonIdx) {
        people[moveIdx] = people[--moveIdx]
      }
      people[destinationPersonIdx] = tempPerson
      return true
    }
      
    else {
      return false
    }
  }
}