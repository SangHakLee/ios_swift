//
//  ViewController.swift
//  TableView
//
//  Created by 이상학 on 2015. 9. 25..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var animals = [Animal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animals = [Animal(name : "개"),Animal(name : "닭"),Animal(name : "소"),Animal(name : "양"),Animal(name : "말")]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var animal : Animal
        
        animal = animals[indexPath.row]
        
        cell.textLabel?.text = animal.name
        
        return cell
    }


}

