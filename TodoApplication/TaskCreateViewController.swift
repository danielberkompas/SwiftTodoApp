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
    
    @lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRectMake(10, 20, 300, 44)
        textField.placeholder = "Enter name of task here"
        return textField
    }()
    
    @lazy var descriptionField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRectMake(10, 84, 300, 44)
        textField.placeholder = "Enter very brief description of the task"
        return textField
    }()
    
    @lazy var exitButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(15, 140, 140, 44)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Exit", forState: .Normal)
        button.addTarget(self, action: "exitAction", forControlEvents: .TouchUpInside)
        return button
    }()
    
    @lazy var submitButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(165, 140, 140, 44)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Submit", forState: .Normal)
        button.addTarget(self, action: "submitAction", forControlEvents: .TouchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(nameField)
        view.addSubview(descriptionField)
        view.addSubview(exitButton)
        view.addSubview(submitButton)
    }
    
    // MARK button methods
    func submitAction() {
        let nameTask = nameField.text
        let descriptionTask = descriptionField.text
        
        // send with delegate
        delegate?.taskCreated(["name": nameTask, "description": descriptionTask])
        
        // clear out the text field
        nameField.text = nil
        descriptionField.text = nil
        exitAction()
    }
    
    func exitAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
