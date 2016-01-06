//
//  CouresesTableViewController.swift
//  courses
//
//  Created by 이상학 on 2015. 9. 17..
//  Copyright (c) 2015년 ryan. All rights reserved.
//

import UIKit

class CouresesTableViewController: UITableViewController {
    
    let coureses = ["TDD for Java", "Swift", "Ruby", "Java SE 8 ", "PHP"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coureses.count // 열 개수 만큼 가져온다.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = coureses[row]
        return cell
    }
    
}
