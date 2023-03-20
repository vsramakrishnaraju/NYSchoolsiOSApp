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
    
    struct Cells {
        static let NYSchoolsCell = "NYSchoolCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        title = "NYSchools"
        // Do any additional setup after loading the view.
                
        NYSServcie.shared.execute(.listNYSchoolsRequest, expecting: [NYSchools].self) { result in
            switch result {
            case .success(let model):
                self.nySchools = model
            case .failure(let error):
                print(String(describing: error))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        configureTableView()
        setTableViewDelegate()
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
    
}

