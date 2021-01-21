//
//  PersonnageViewController.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit
import Alamofire

class PersonnageViewController: UIViewController {
    
    private var url: String?
    private var people: People?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var labelDateNaissance: UILabel!
    @IBOutlet weak var labelPlaneteOrigine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let apiUrl = url {
            loadData(withUrl: apiUrl)
        }
        
        mainStackView.layer.borderWidth = 1
        mainStackView.layer.borderColor = UIColor.white.cgColor
        mainStackView.layer.cornerRadius = 10
    }
    
    func setUrl(withUrl url: String) {
        self.url = url
    }
    
    private func loadData(withUrl url: String) {
        AF
            .request(url)
            .validate(statusCode: [200])
            .responseDecodable(of: People.self) {[weak self] (resp) in
                switch resp.result {
                    case .success(let peopleCreated):
                        self?.people = peopleCreated
                        print(peopleCreated.birthYear)
                    case .failure(let error):
                        print(error)
                }
            }
    }
    
    @IBAction func goBack() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
