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
    
    @lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRectMake(10, 44, 300, 44)
        label.text = self.nameVar
        return label
    }()
    
    @lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRectMake(10, 100, 300, 44)
        label.text = self.descriptionVar
        return label
    }()
    
    @lazy var completedButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(15, 160, 140, 44)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Mark Complete", forState: .Normal)
        button.addTarget(self, action: "completeAction", forControlEvents: .TouchUpInside)
        return button
    }()
    
    @lazy var exitButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(165, 160, 140, 44)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Exit", forState: .Normal)
        button.addTarget(self, action: "exitAction", forControlEvents: .TouchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(completedButton)
        view.addSubview(exitButton)
    }
    
    func completeAction() {
        delegate?.markComplete(indexPath)
        exitAction()
    }
    
    func exitAction() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}