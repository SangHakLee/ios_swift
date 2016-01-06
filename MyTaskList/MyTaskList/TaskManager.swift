//
//  TaskManager.swift
//  MyTaskList
//
//  Created by 이상학 on 2015. 9. 24..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

var taskMgr : TaskManager = TaskManager()

struct task {
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    func addTask(name: String, desc:String){
        tasks.append(task(name: name, desc: desc))
    }
}
