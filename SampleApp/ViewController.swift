//
//  ViewController.swift
//  SampleApp
//
//  Created by natehancock on 6/28/22.
//

import UIKit

class ViewController: UIViewController {

    var dataSource = TableViewDataSource(state: .empty)
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func didTapButton() {
        guard let text = textField.text else {
            return
        }
        
        Task {
            do {
                let response = try await API.shared.fetchWord(query: text)
                self.dataSource.updateState(.word(response.word)) {
                    self.tableView.reloadData()
                }
            } catch {
                self.dataSource.updateState(.empty) {
                    self.tableView.reloadData()
                }
                print("NETWORK ERROR: ", error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
    }


}

extension ViewController: UITableViewDelegate {
    
}
