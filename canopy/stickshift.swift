//
//  stickshift.swift
//  canopy
//
//  Created by David English on 2015-11-25.
//  Copyright © 2015 David English. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class Stickshift {
    
    var projectsJSON:JSON = [:]
    var projects = [NSManagedObject]()
    
    init(){
        loadJson()
        loadProjectsIntoCD()
        printEntity("Project")
    }
    
    func loadJson() {
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                projectsJSON = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            }
        }
    }
    
    func loadProjectsIntoCD() {
        for (_,projectJson):(String, JSON) in projectsJSON["project"] {
            let id = Int(String(projectJson["id"]))
            let name = String(projectJson["name"])
            saveProject(id!, name: name)
        }
    }
    
    func saveProject(id: Int, name: String) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Project",
            inManagedObjectContext:managedContext)
        
        let project = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        project.setValue(id, forKey: "id")
        project.setValue(name, forKey: "name")
        
        //4
        do {
            try managedContext.save()
            //5
            projects.append(project)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func savePlot(id: Int) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Plot",
            inManagedObjectContext:managedContext)
        
        let plot = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        plot.setValue(id, forKey: "id")
        
        //4
        do {
            try managedContext.save()
            //5
            projects.append(plot)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func saveCoordinatePair(id: Int, longitude: String, latitude: String) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("CoordinatePair",
            inManagedObjectContext:managedContext)
        
        let coordinatePair = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        coordinatePair.setValue(id, forKey: "id")
        coordinatePair.setValue(longitude, forKey: "longitude")
        coordinatePair.setValue(latitude, forKey: "latitude")
        
        //4
        do {
            try managedContext.save()
            //5
            projects.append(coordinatePair)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func saveSpecies(id: Int, name: String, count: Int, averageHeight: Int, averageAge: Int) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("CoordinatePair",
            inManagedObjectContext:managedContext)
        
        let coordinatePair = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        coordinatePair.setValue(id, forKey: "id")
        coordinatePair.setValue(name, forKey: "name")
        coordinatePair.setValue(count, forKey: "count")
        coordinatePair.setValue(averageHeight, forKey: "average height")
        coordinatePair.setValue(averageAge, forKey: "average age")
        
        //4
        do {
            try managedContext.save()
            //5
            projects.append(coordinatePair)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    
    func printEntity(entity: String) {
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let answer = results as! [NSManagedObject]
            print(answer)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}