//
//  ViewController.swift
//  TableViewStructure
//
//  Created by 이상학 on 2015. 9. 30..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var FirstTableArray = [String]()
    var SecondArray = [SecondTable]() // 두번째 뷰에 연결이 되지않기 때문에 또 선언

    override func viewDidLoad() {
        super.viewDidLoad()
        FirstTableArray = ["First", "Second", "Third"]
        
        SecondArray = [
            SecondTable(SecondTitle : ["1-1", "1-2", "1-3"]),
            SecondTable(SecondTitle : ["2-1", "2-2", "2-3"]),
            SecondTable(SecondTitle : ["3-1", "3-2", "3-3"])
        ]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstTableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        Cell.textLabel?.text = FirstTableArray[indexPath.row]
        
        return Cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { // 어디로 보낼건인가?
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        var DestViewController = segue.destinationViewController as! SecondTableViewController // SecondTableViewController로
        var SecondTableArrayTwo : SecondTable // 이 안엔서 편하게 쓸수 있게
        
        SecondTableArrayTwo = SecondArray[indexPath.row] // 개수만큼 row를 만들어준다.
        DestViewController.SecondArray = SecondTableArrayTwo.SecondTitle // 두번째 테이블에 들어간다.
    }

}

