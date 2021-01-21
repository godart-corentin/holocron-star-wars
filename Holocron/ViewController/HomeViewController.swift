//
//  ViewController.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(true, animated: false)
        } else {
            print("Pas de navigationController")
        }
    }
    
    @IBAction func onSearch() {
        if let searchInput = searchBar.text {
            if searchInput.count > 0 {
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "resultVC") as! ResultViewController
                
                vc.setSearchInput(withInput: searchInput)
                
                if let navController = self.navigationController {
                    navController.pushViewController(vc, animated: true)
                } else {
                    print("Pas de navigationController")
                }
            }
        }
    }
}

