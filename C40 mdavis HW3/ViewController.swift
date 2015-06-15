//
//  ViewController.swift
//  C40 mdavis HW3, HW4
//
//  Created by mike davis on 6/9/15.
//  Copyright (c) 2015 mike davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var editButton: UIButton!
  
  let people = PersonList()
  var editMode = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    editMode = false
    editButton.setTitle("Edit", forState: UIControlState.Normal)
    
//    println("#view# \(view.description)")
//    for subView in view.subviews {
//      if let sub = subView as? UIScrollView {
//        println("#subview# \(sub.description) contentSize \(sub.contentSize)")
//      } else {
//        println("#subview# \(subView.description)")
//      }
//    }
  }

  @IBAction func editTapped(sender: AnyObject) {
    if !editMode {
      tableView.setEditing(true, animated: true)
      editButton.setTitle("Done", forState: UIControlState.Normal)
    } else {
      tableView.setEditing(false, animated: true)
      editButton.setTitle("Edit", forState: UIControlState.Normal)
    }
    editMode = !editMode
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.getCount()
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    cell.showsReorderControl = true
    
    if let name = people.getName(indexPath.row) {
      cell.textLabel?.text = name.first + " " + name.last
    }
    else {
      cell.textLabel?.text = ""
    }
    return cell
  }
  
  func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }

  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      
      people.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
  }
  
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    
    people.moveAtIndexToDestinationIndex(sourceIndexPath.row, destinationPersonIdx: destinationIndexPath.row)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "ShowPersonDetail" {
      let detailVC = segue.destinationViewController as! PersonDetailViewController
      
      let indexPath = tableView.indexPathForSelectedRow()
      if let selectedRow = indexPath?.row {
        detailVC.rosterIndex = selectedRow
        detailVC.person = people.getAtIndex(selectedRow)
      }
      else {
        detailVC.rosterIndex = -1
      }
    }
  }
}

