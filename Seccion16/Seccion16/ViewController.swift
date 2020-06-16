//
//  ViewController.swift
//  Seccion16
//
//  Created by Daniel Escandell González on 13/06/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Constants
    private let myCountries  = ["España", "Portugal", "EEUU", "Italia", "Rusia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table Views
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "myCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //Funcion para definir el tamaño de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { //Seccion 1
                return 50 //Tamaño 50
        }else {
            return UITableView.automaticDimension //Tamaño, si lo dejamos por defecto es de 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 { //Si estamos en la seccion 1
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .lightGray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.selectionStyle = .gray
                cell?.accessoryType = .detailButton
            }
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
            
        } else { //Si estamos en la seccion 2
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? myCustomTableViewCell
            
            cell!.myFirstLabel.text = String (indexPath.row + 1 )
            cell!.mySecondLabel.text = myCountries[indexPath.row]
            
            if indexPath.row == 2{
                cell!.textLabel!.text = "hfdshfd sufhudsihfus ihfdsh hfdsufhsd ufhdsiufhsuhfu hfsdu fudhsufhsu fhushdufhd"
            }
            
            return cell!
        }
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
