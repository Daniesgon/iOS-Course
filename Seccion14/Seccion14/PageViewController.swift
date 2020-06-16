//
//  PageViewController.swift
//  Seccion14
//
//  Created by Daniel Escandell González on 24/05/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    //Variables
    private var myControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myGreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcGreen")
        let myPinkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcPink")
        let myBlueVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcBlue")
        let myYellowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcYellow")
        
        myControllers.append(myGreenVC)
        myControllers.append(myPinkVC)
        myControllers.append(myBlueVC)
        myControllers.append(myYellowVC)
        
        setViewControllers([myGreenVC], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }else if index == 1{
            return myControllers.first
        }else if index == 2 {
            return myControllers[1]
        }
        return myControllers[2]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers[1]
        }else if index == 1{
            return myControllers[2]
        }else if index == 2 {
            return myControllers.last
        }
        return myControllers.first
    }

}

