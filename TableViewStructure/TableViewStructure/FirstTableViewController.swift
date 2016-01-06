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
    var ThirdArray = [ThirdView]() // 세번제 데이터 struct들이 저장되는 곳

    override func viewDidLoad() {
        super.viewDidLoad()
        FirstTableArray = ["알리바바", "반스", "스시테이"]
        
        SecondArray = [
            SecondTable(SecondTitle : ["짜장면", "짬뽕", "탕수육"]),
            SecondTable(SecondTitle : ["꼼띵능", "포탐", "팟타이"]),
            SecondTable(SecondTitle : ["돈까스", "몬스터롤", "타코야키"])
        ]
        
        ThirdArray = [
            ThirdView(ThirdViewArray: ["$15", "$25", "$22"]),
            ThirdView(ThirdViewArray: ["$55", "$10", "$100"]),
            ThirdView(ThirdViewArray: ["$18", "$33", "$21"])
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
        
        var ThirdAnswerArray : ThirdView
        ThirdAnswerArray = ThirdArray[indexPath.row]
        DestViewController.SecondAnswerArray = ThirdAnswerArray.ThirdViewArray // 세번째로 보냄
    }

}

