//
//  ViewController.swift
//  MapKit2
//
//  Created by 이상학 on 2015. 9. 25..
//  Copyright © 2015년 ryan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController {
    @IBOutlet weak var Map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var location = CLLocationCoordinate2DMake(42.68628, -73.85742)
        var span = MKCoordinateSpan (latitudeDelta: 0.02, longitudeDelta: 0.02) // 어느정도로 확대 할건지
        var region = MKCoordinateRegion(center: location, span : span)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "내 집 "
        annotation.subtitle = "비밀번호는 0000"
        
        Map.setRegion(region, animated: true)
        Map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

