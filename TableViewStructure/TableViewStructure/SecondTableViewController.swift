//
//  ::
//  TableViewStructure
//
//  Created by 이상학 on 2015. 9. 30..
//  Copyright © 2015년 ryan. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController : UITableViewController {
    
    var SecondArray = [String]()
    var SecondAnswerArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as! UITableViewCell
        
        Cell.textLabel?.text = SecondArray[indexPath.row]
        
        return Cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { // 버튼 눌렀을 때 보내는거
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        var DestViewController = segue.destinationViewController as! ViewController
        
        DestViewController.FirstString = SecondAnswerArray[indexPath.row]
    }

}
