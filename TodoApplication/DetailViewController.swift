//
//  DetailViewController.swift
//  TodoApplication
//
//  Created by Daniel Berkompas on 6/13/14.
//  Copyright (c) 2014 Daniel Berkompas. All rights reserved.
//

import UIKit

protocol CompletedDelegate {
    func markComplete(indexPath: Int)
}

class DetailViewController: UIViewController {
    var nameVar = ""
    var descriptionVar = ""
    var indexPath: Int = 0
    var delegate: CompletedDelegate?
    
    // name label
    let nameLabelRect = CGRectMake(10, 44, 300, 44)
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // description label
    let descriptionRect = CGRectMake(10, 100, 300, 44)
    let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // task completed button
    let completedRect = CGRectMake(15, 160, 140, 44)
    let completedButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // exit button
    let exitRect = CGRectMake(165, 160, 140, 44)
    let exitButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.whiteColor()
        
        nameLabel.frame = nameLabelRect
        nameLabel.text = nameVar
        self.view.addSubview(nameLabel)
        
        descriptionLabel.frame = descriptionRect
        descriptionLabel.text = descriptionVar
        self.view.addSubview(descriptionLabel)
        
        completedButton.frame = completedRect
        completedButton.backgroundColor = UIColor.blueColor()
        completedButton.setTitle("Mark Complete", forState: .Normal)
        completedButton.addTarget(self, action: "completeAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(completedButton)
        
        exitButton.frame = exitRect
        exitButton.backgroundColor = UIColor.blueColor()
        exitButton.setTitle("Exit", forState: .Normal)
        exitButton.addTarget(self, action: "exitAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(exitButton)
        
        println(nameVar)
        println(descriptionVar)
        println(indexPath)
    }
    
    func completeAction() {
        delegate?.markComplete(indexPath)
        exitAction()
    }
    
    func exitAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}