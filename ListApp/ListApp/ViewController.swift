//
//  ViewController.swift
//  ListApp
//
//  Created by jimmychain on 1/21/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit
import CoreData

class tableViewController: UITableViewController, UITextFieldDelegate {
    var listItems = [NSManagedObject]()
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "ListEntity")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            listItems = results as! [NSManagedObject]
        }catch{
            print("fetch error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addItem")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        managedContext.deleteObject(listItems[indexPath.row])
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        listItems.removeAtIndex(indexPath.row)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        let item = listItems[indexPath.row]
        cell.textLabel?.text = item.valueForKey("item") as? String
        
        return cell
    }
    
    func addItem() {
        let ac = UIAlertController(title: "add item", message: "hehe", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "add2", style: UIAlertActionStyle.Default, handler: {
            [unowned self, ac] (action) in
            if let field = ac.textFields![0] as? UITextField {
                self.saveItem(field.text!)
                self.tableView.reloadData()
            }
        }))
            
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        ac.addTextFieldWithConfigurationHandler({
            [unowned self](textField) in
            textField.delegate = self
            textField.placeholder = "add some thing..."
        })
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func saveItem(itemToSave: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("ListEntity", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        item.setValue(itemToSave, forKey: "item")
        
        do {
            try managedContext.save()
            listItems.append(item)
        } catch {
            print("error")
        }
    }
}

