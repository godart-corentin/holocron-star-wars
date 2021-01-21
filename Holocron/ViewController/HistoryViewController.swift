//
//  HistoryViewController.swift
//  Holocron
//
//  Created by Coco on 21/01/2021.
//

import UIKit


class HistoryViewController: UIViewController {
    
    private var dataList: [String] = []
    
    @IBOutlet weak var historyTableView: UITableView!
    
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        let defaults = UserDefaults.standard
        if let historique = defaults.array(forKey: "historique") {
            dataList = historique as! [String]
        } else {
            dataList = []
        }
        
        if let navController = self.navigationController {
            navController.setNavigationBarHidden(true, animated: false)
        }
    }
    
    @IBAction func goBack() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recherche = dataList[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "resultVC") as! ResultViewController
        vc.setSearchInput(withInput: recherche)
        if let navController = self.navigationController {
            navController.pushViewController(vc, animated: true)
        } else {
            print("Pas de navigationController")
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HistoryTitleTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "titleCellID", for: indexPath) as? HistoryTitleTableViewCell
        
        guard let sureCell = cell else {
            return UITableViewCell()
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        sureCell.selectedBackgroundView = backgroundView
        sureCell.fill(withData: dataList[indexPath.row])

        return sureCell
    }
}
