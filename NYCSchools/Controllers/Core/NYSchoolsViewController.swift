//
//  NCSchoolsViewController.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import UIKit

/// controlelr to serach for NYSchools 
final class NYSchoolsViewController: UIViewController {
    
    var tableView = UITableView()
    var nySchools = [NYSchools]()
    var nySchoolsSatScore = [NYSchoolsSATScore]()
    var filteredNySchools = [NYSchools]()
    
    lazy var searchBar:UISearchBar = UISearchBar()
    
    struct Cells {
        static let NYSchoolsCell = "NYSchoolCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "New York Schools"
        // Do any additional setup after loading the view.
        
        serviceCall()
        configureTableView()
        setTableViewDelegate()
        searchBarView()
    }
    
    func searchBarView() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        navigationItem.titleView = searchBar
    }
    
    func serviceCall() {
        NYSServcie.shared.execute(.listNYSchoolsRequest, expecting: [NYSchools].self) { result in
            switch result {
            case .success(let model):
                self.nySchools = model
                self.filteredNySchools = model // Initialize filtered list with all schools
            case .failure(let error):
                print(String(describing: error))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        NYSServcie.shared.execute(.listNYSchoolsSatScoreRequest, expecting: [NYSchoolsSATScore].self) { result in
            switch result {
            case .success(let model):
                self.nySchoolsSatScore = model
            case .failure(let error):
                print(String(describing: error))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(NYSchoolCell.self, forCellReuseIdentifier: Cells.NYSchoolsCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NYSchoolsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nySchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.NYSchoolsCell) as! NYSchoolCell
        cell.nySchooolTitleLable.text = nySchools[indexPath.row].school_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nySchoolFull = nySchools
        let nySchoolSatFull = nySchoolsSatScore
        let index = indexPath.row

        let nySchool = nySchools[indexPath.row].school_name
        let nySchoolDes = nySchools[indexPath.row].overview_paragraph
        let nySchoolLocn = nySchools[indexPath.row].location
        
        let nyNYSSatScoreVC = NYSchoolsSatScoreViewController()
        nyNYSSatScoreVC.nySchoolSat = nySchool
        nyNYSSatScoreVC.text = nySchoolDes
        nyNYSSatScoreVC.nySchoolLocn = nySchoolLocn
        nyNYSSatScoreVC.nySchoolFull1 = nySchoolFull
        nyNYSSatScoreVC.nySchoolFull2 = nySchoolSatFull
        nyNYSSatScoreVC.indexRow = index
        
        navigationController?.pushViewController(nyNYSSatScoreVC, animated: true)
    }
}

extension NYSchoolsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredNySchools = nySchools
        } else {
            filteredNySchools = nySchools.filter { $0.school_name!.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}

