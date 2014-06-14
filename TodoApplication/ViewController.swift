//
//  ViewController.swift
//  TodoApplication
//
//  Created by Daniel Berkompas on 6/12/14.
//  Copyright (c) 2014 Daniel Berkompas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateTaskDelegate, CompletedDelegate {
    
    var dataSource: Dictionary<String, String>[][] = [[], []]
    
    @lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRectMake(20, 64, 280, UIScreen.mainScreen().bounds.size.height - 84)
        tableView.backgroundColor = UIColor.blueColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    @lazy var createButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width - 84, 10, 44, 44)
        button.backgroundColor = UIColor.orangeColor()
        button.setTitle("+", forState: .Normal)
        button.addTarget(self, action: "createTask", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }()
    
    let createViewController: TaskCreateViewController = {
        let viewController = TaskCreateViewController()
        return viewController
    }()
    
    let detailViewController: DetailViewController = {
        let viewController = DetailViewController()
        return viewController
    }()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.view.addSubview(createButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Conform to protocols
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
       return dataSource.count
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        if let path = indexPath {
            let currentDictionary = dataSource[path.section][path.row]
            let currentString = currentDictionary["name"]
            cell.text = currentString
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        // Display the detailViewController
        detailViewController.delegate = self
        
        let currentDictionary = dataSource[indexPath.section][indexPath.row]
        let currentName = currentDictionary["name"]
        let currentDescription = currentDictionary["description"]
        
        detailViewController.nameVar = currentName!
        detailViewController.descriptionVar = currentDescription!
        detailViewController.indexPath = indexPath.row
        
        presentViewController(detailViewController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String {
        switch section {
        case 0:
            return "Not Completed"
        case 1:
            return "Completed"
        default:
            return ""
        }
    }
    
    // Button to open other view controller
    func createTask() {
        createViewController.delegate = self
        self.presentViewController(createViewController, animated: true, completion: nil)
    }
    
    // MARK create task delegate
    
    func taskCreated(task: Dictionary<String, String>) {
        dataSource[0] += task
        tableView.reloadData()
    }
    
    // MARK completed delegate method
    func markComplete(indexPath: Int) {
        let currentTask = dataSource[0][indexPath]
        dataSource[0].removeAtIndex(indexPath)
        dataSource[1] += currentTask
        
        tableView.reloadData()
    }
}

