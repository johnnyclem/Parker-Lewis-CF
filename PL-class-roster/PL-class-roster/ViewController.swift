//
//  ViewController.swift
//  PL-class-roster
//
//  Created by Parker Lewis on 8/7/14.
//  Copyright (c) 2014 Parker Lewis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
//    @IBOutlet weak var textBox: UITextView!
//    @IBOutlet weak var personImage: UIImageView!
//    @IBOutlet weak var nextPage: UIBarButtonItem!

    @IBOutlet weak var tableView: UITableView!
    var roster = [Person]()
    var rosterIndex: Int = 0
    var currentPerson = Person(firstName: "First: ", lastName: "Last: ")

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self

        
        // initialize Person objects
        var person1 = Person(firstName: "Archie", lastName: "Andrews", image: UIImage(named:"archie-andrews.png"))
        var person2 = Person(firstName: "Bugs", lastName: "Bunny", image: UIImage(named:"bugs-bunny.png"))
        var person3 = Person(firstName: "Cap'n", lastName: "Crunch", image: UIImage(named:"capn-crunch.png"))
        var person4 = Person(firstName: "Donald", lastName: "Duck", image: UIImage(named:"donald-duck.png"))
        
        //create the array of people
        self.roster = self.makePersonArray(person1, person2, person3, person4)
    }
    
    
    // new method to create array of Person objects
    func makePersonArray(people: Person...) -> [Person] {
        var roster = [Person]()
        for i in people {
            roster.append(i)
        }
        return roster
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return roster.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var personInRow = roster[indexPath.row]
        cell.textLabel.text = personInRow.fullName()
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.currentPerson = roster[indexPath.row]
        println(currentPerson.image)
    }

    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "personSegue") {
            var svc = segue!.destinationViewController as PersonViewController
            
            svc.firstNamePassed = currentPerson.firstName
            svc.lastNamePassed = currentPerson.lastName
//            svc.imagePassed = currentPerson.image
        }
    }
    
    
    
    
    
    
    
    
    // press the button to display info in textbox and image view
//    @IBAction func populateRoster(sender: AnyObject) {
//        
//        currentPerson = roster[rosterIndex]
//        //display name in text box
//        textBox.text = "Person number " + (String)(rosterIndex + 1) + " is \n\n" + currentPerson.fullName()
//
//
//        //display image in image view
//        personImage.image = currentPerson.image
//        
//        
//        // cycle through the arrays and reset to zero if the index reaches the end
//        rosterIndex++
//        if rosterIndex == roster.count { rosterIndex = 0 }
//    }
    
    
    
    
    

}

