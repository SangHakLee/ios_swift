//
//  ViewController.swift
//  ImageSelect
//
//  Created by 이상학 on 2015. 10. 5..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var textField: UITextField!
    
    var string = ""
    
    @IBAction func selectImageTapped(sender: AnyObject) { // 사진 불러오기
        var pickerController = UIImagePickerController()
        pickerController.delegate = self // ViewController 로 대행
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary // 사진 가져오는 곳은 사진첩
        self.presentViewController(pickerController, animated: true, completion: nil)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        myImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImage.backgroundColor = UIColor.clearColor()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func completeButtonTapped(sender: AnyObject) {
    }

}

