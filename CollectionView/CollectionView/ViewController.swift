//
//  ViewController.swift
//  CollectionView
//
//  Created by 이상학 on 2015. 9. 26..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Array = ["봄소풍", "여름소풍", "가을소풍"]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
//        label.text = Array[indexPath.row]
        
        var label = cell.viewWithTag(3) as! UILabel
        
        var button = cell.viewWithTag(27) as! UIButton
        
        label.text = Array[indexPath.row]
        button.setTitle(Array[indexPath.row], forState: UIControlState.Normal)
        return cell
    }

}

