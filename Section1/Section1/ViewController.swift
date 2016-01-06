//
//  ViewController.swift
//  Section1
//
//  Created by 이상학 on 2015. 9. 25..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    struct Object {
        var sectionName : String!
        var sectionObjects : [String]!
    }
    
    var objectsArray = [Object]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objectsArray = [
            Object(sectionName: "중식", sectionObjects: ["자장면", "짬뽕", "탕수육"]),
            Object(sectionName: "양식", sectionObjects: ["피자", "치킨", "스프"]),
            Object(sectionName: "한식", sectionObjects: ["밥", "찌게", "조림"])
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = objectsArray[indexPath.section].sectionObjects[indexPath.row] // 섹션 내부의 이름
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    


}

