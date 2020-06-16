//
//  ViewController.swift
//  Seccion15
//
//  Created by Daniel Escandell González on 30/05/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botonNegro(_ sender: Any) {
        performSegue(withIdentifier: "vcNegro", sender: self)
        
    }
    
    @IBAction func botonRosa(_ sender: Any) {
        performSegue(withIdentifier: "vcRosa", sender: self)
    }
    
    @IBAction func botonAzul(_ sender: Any) {
        performSegue(withIdentifier: "vcAzul", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.identifier as? "vcNegro"{
            
            destino.titulo = "Negro"
            
        }
        if let destino = segue.destination as? ViewControllerRosa{
            
            destino.titulo = "Rosa"
            
        }
        if let destino = segue.destination as? ViewControllerAzul{
            
            destino.titulo = "Azul"
            
        }
        
    }
    
}

