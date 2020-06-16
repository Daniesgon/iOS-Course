//
//  ViewController.swift
//  Seccion14
//
//  Created by Daniel Escandell González on 20/05/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myViewWeb: WKWebView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myViewWeb.load(URLRequest(url: URL(string: "https://google.es")!))
        
        
    }


}

