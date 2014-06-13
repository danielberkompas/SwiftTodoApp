//
//  TaskCreateViewController.swift
//  TodoApplication
//
//  Created by Daniel Berkompas on 6/12/14.
//  Copyright (c) 2014 Daniel Berkompas. All rights reserved.
//

import UIKit

protocol CreateTaskDelegate {
    func taskCreated(task: Dictionary<String, String>)
}

class TaskCreateViewController: UIViewController {
    var delegate: CreateTaskDelegate?
    
    // field for name
    let nameFieldRect = CGRectMake(10, 20, 300, 44)
    let nameField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    // field for description
    let descriptionFieldRect = CGRectMake(10, 84, 300, 44)
    let descriptionField: UITextField = {
        let descriptionField = UITextField()
        return descriptionField
    }()
    
    // exit button
    let exitButtonRect = CGRectMake(15, 140, 140, 44)
    let exitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // submit button
    let submitButtonRect = CGRectMake(165, 140, 140, 44)
    let submitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        nameField.frame = nameFieldRect
        nameField.placeholder = "Enter name of task here"
        descriptionField.frame = descriptionFieldRect
        self.view.addSubview(nameField)
        
        descriptionField.frame = descriptionFieldRect
        descriptionField.placeholder = "enter very brief description of the task"
        self.view.addSubview(descriptionField)
        
        exitButton.frame = exitButtonRect
        exitButton.backgroundColor = UIColor.blueColor()
        exitButton.setTitle("Exit", forState: .Normal)
        exitButton.addTarget(self, action: "exitAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(exitButton)
        
        submitButton.frame = submitButtonRect
        submitButton.backgroundColor = UIColor.blueColor()
        submitButton.setTitle("Submit", forState: .Normal)
        submitButton.addTarget(self, action: "submitAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(submitButton)
    }
    
    
    // MARK button methods 
    
    func submitAction() {
        // retrieve the fvalues from the fields
        // pass as a dictionary to the view controller
        let nameTask = nameField.text
        let descriptionTask = descriptionField.text
        
        // send with delegate
        delegate?.taskCreated(["name": nameTask, "description": descriptionTask])
        
        nameField.text = nil
        descriptionField.text = nil
        exitAction() // I added this
    }
    
    func exitAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
