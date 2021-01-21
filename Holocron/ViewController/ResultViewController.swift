//
//  ResultViewController.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import Alamofire

enum Endpoint: String, CaseIterable {
    case people = "people"
    case films = "films"
    case starships = "starships"
    case vehicles = "vehicles"
    case species = "species"
    case planets = "planets"
}

class ResultViewController: UIViewController {

    private var searchInput: String?
    private var dataList: [ApiData] = []
    
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var titreRecherche: UILabel!
    
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let search = searchInput {
            titreRecherche.text = search.lowercased()
            
            for endpoint in Endpoint.allCases {
                loadData(withEndpoint: endpoint.rawValue, withSearchValue: search)
            }

            dispatchGroup.notify(queue: .main) {
                self.resultTableView.reloadData()
            }
        }
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(true, animated: false)
        }
    }
    
    @IBAction func goBack() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func setSearchInput(withInput input: String) {
        searchInput = input
    }
    
    private func loadData(withEndpoint endpoint: String, withSearchValue searchValue: String) {
        self.dispatchGroup.enter()
        var components = URLComponents()
            components.scheme = "https"
            components.host = "swapi.dev"
            components.path = "/api/\(endpoint)/"
            components.queryItems = [
                URLQueryItem(name: "search", value: searchValue)
            ]
        if let url = components.url {
            AF
                .request(url)
                .validate(statusCode: [200])
                .responseDecodable(of: ApiResponse.self) {[weak self] (resp) in
                    switch resp.result {
                        case .success(let apiResponse):
                            if apiResponse.count > 0 {
                                let arrayResponse: [ApiData] = apiResponse.results ?? []
                                for item in arrayResponse {
                                    item.type = endpoint.capitalized
                                }
                                self?.dataList.append(contentsOf: arrayResponse)
                            }
                        case .failure(let error):
                            print(error)
                    }
                    self?.dispatchGroup.leave()
                }
        } else {
            self.dispatchGroup.leave()
        }
    }
}

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let apiData = dataList[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let type = apiData.type {
            switch type {
                case "People":
                    let vc = storyboard.instantiateViewController(identifier: "personnageVC") as! PersonnageViewController
                    vc.setUrl(withUrl: apiData.url ?? "")
                    if let navController = self.navigationController {
                        navController.pushViewController(vc, animated: true)
                    } else {
                        print("Pas de navigationController")
                    }
                default:
                    break;
            }
        }
    }
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultTitleTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "titleCellID", for: indexPath) as? ResultTitleTableViewCell
        
        guard let sureCell = cell else {
            return UITableViewCell()
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        sureCell.selectedBackgroundView = backgroundView
        
        sureCell.apiData = dataList[indexPath.row]
        sureCell.fill(withData: dataList[indexPath.row])
        
        return sureCell
    }
}
