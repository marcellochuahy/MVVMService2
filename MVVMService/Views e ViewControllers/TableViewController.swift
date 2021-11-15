//
//  TableViewController.swift
//  MVVMService
//
//  Created by Marcello Chuahy on 14/11/21.
//

import UIKit

class TableViewController: UITableViewController {

    let viewModel = UserTableViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        viewModel.users.bind { [weak self] _ in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.users.value?[indexPath.row].name
        return cell
    }

}
