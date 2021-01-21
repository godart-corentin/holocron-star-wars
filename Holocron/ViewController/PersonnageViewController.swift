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
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDateNaissance: UILabel!
    @IBOutlet weak var labelPlaneteOrigine: UILabel!
    @IBOutlet weak var labelEspece: UILabel!
    @IBOutlet weak var labelVehicules: UILabel!
    @IBOutlet weak var labelVaisseaux: UILabel!
    @IBOutlet weak var labelFilms: UILabel!
    
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
            .responseString(completionHandler: { (respString) in
                print(respString)
            })
            .responseDecodable(of: People.self) {[weak self] (resp) in
                switch resp.result {
                    case .success(let peopleCreated):
                        self?.people = peopleCreated
                        if let name = peopleCreated.name {
                            self?.labelName.text = name.lowercased()
                        }
                        if let birthYear = peopleCreated.birthYear {
                            self?.labelDateNaissance.text = birthYear
                        }
                        if let planeteOrigine = peopleCreated.homeworld {
                            AF.request(planeteOrigine)
                                .validate(statusCode: [200])
                                .responseDecodable(of: Planet.self) {[weak self] (respPlanet) in
                                    switch respPlanet.result {
                                        case .success(let planet):
                                            if let planetName = planet.name {
                                                self?.labelPlaneteOrigine.text = planetName
                                            }
                                        case .failure(let err):
                                            print(err)
                                    }
                                }
                        }
                        if let especes = peopleCreated.species {
                            if especes.count > 0 {
                                AF.request(especes[0])
                                    .validate(statusCode: [200])
                                    .responseDecodable(of: Species.self) {[weak self] (respSpecies) in
                                        switch respSpecies.result {
                                            case .success(let species):
                                                if let speciesName = species.name {
                                                    self?.labelEspece.text = speciesName
                                                }
                                            case .failure(let err):
                                                print(err)
                                        }
                                    }
                            } else {
                                self?.labelEspece.text = "None"
                            }
                        }
                        if let films = peopleCreated.films {
                            if films.count > 0 {
                                for film in films {
                                    AF.request(film)
                                        .validate(statusCode: [200])
                                        .responseDecodable(of: Film.self) {[weak self] (respFilm) in
                                            switch respFilm.result {
                                                case .success(let film):
                                                    if let filmName = film.title {
                                                        var newText = self?.labelFilms.text ?? ""
                                                        if(newText != "") {
                                                            newText += "\n"
                                                        }
                                                        newText += filmName
                                                        self?.labelFilms.text = newText
                                                    }
                                                case .failure(let err):
                                                    print(err)
                                            }
                                        }
                                }
                            } else {
                                self?.labelFilms.text = "None"
                            }
                        }
                        if let vaisseaux = peopleCreated.starships {
                            if vaisseaux.count > 0 {
                                for vaisseau in vaisseaux {
                                    AF.request(vaisseau)
                                        .validate(statusCode: [200])
                                        .responseDecodable(of: Starship.self) {[weak self] (respStarship) in
                                            switch respStarship.result {
                                                case .success(let starship):
                                                    if let starshipName = starship.name {
                                                        var newText = self?.labelVaisseaux.text ?? ""
                                                        if(newText != "") {
                                                            newText += "\n"
                                                        }
                                                        newText += starshipName
                                                        self?.labelVaisseaux.text = newText
                                                    }
                                                case .failure(let err):
                                                    print(err)
                                            }
                                        }
                                }
                            } else {
                                self?.labelVaisseaux.text = "None"
                            }
                        }
                        if let vehicules = peopleCreated.vehicles{
                            if vehicules.count > 0 {
                                for vehicule in vehicules {
                                    AF.request(vehicule)
                                        .validate(statusCode: [200])
                                        .responseDecodable(of: Vehicle.self) {[weak self] (respVehicle) in
                                            switch respVehicle.result {
                                                case .success(let vehicle):
                                                    if let vehicleName = vehicle.name {
                                                        var newText = self?.labelVehicules.text ?? ""
                                                        if(newText != "") {
                                                            newText += "\n"
                                                        }
                                                        newText += vehicleName
                                                        self?.labelVehicules.text = newText
                                                    }
                                                case .failure(let err):
                                                    print(err)
                                            }
                                        }
                                }
                            } else {
                                self?.labelVehicules.text = "None"
                            }
                        }
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
