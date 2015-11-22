//
//  ProjectsViewController.swift
//  canopy
//
//  Created by David English on 2015-11-02.
//  Copyright © 2015 David English. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let textCellIdentifier = "project"
    
    @IBOutlet weak var projectTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table Code
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tracksList.count
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        // Configure the cell...
        
        // cell.textLabel?.text = tracksList[indexPath.row]
        
        cell.textLabel?.text = "project name"
        
        return cell
    }
}

