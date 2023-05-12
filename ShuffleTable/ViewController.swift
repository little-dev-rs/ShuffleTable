//
//  ViewController.swift
//  ShuffleTable
//

import TinyConstraints
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCell.self, forCellReuseIdentifier: "listCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.widthToSuperview()
        tableView.centerXToSuperview()
        tableView.topToSuperview(offset: 100)
        tableView.bottomToSuperview()
        

        let item = UIBarButtonItem(title: "Shuffle", style: .plain, target: self, action: #selector(shuffleItems))
        navigationBar.topItem?.rightBarButtonItem = item
    }
    
    @objc func shuffleItems(sender: AnyObject) {
        print("shuffleItems")
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        cell.configureCell(with: "\(indexPath.row)")
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        31
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

