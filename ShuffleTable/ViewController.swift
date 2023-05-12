//
//  ViewController.swift
//  ShuffleTable
//

import TinyConstraints
import UIKit


class ViewController: UIViewController {

    // create initial datasource
    var items: [ListCellModel] = Array(0...31).map { .init(title: "\($0)", isChecked: false)}

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
        items.shuffle()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        let model = items[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // item with reversed isChecked property
        let newItem = ListCellModel(title: items[indexPath.row].title, isChecked: !items[indexPath.row].isChecked)
        
        if !items[indexPath.row].isChecked {
            removeItem(at: indexPath)
            addItem(newItem)
        } else {
            items.remove(at: indexPath.row)
            items.insert(newItem, at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    func removeItem(at indexPath: IndexPath) {
        items.remove(at: indexPath.row) // remove the item from your data source
        tableView.deleteRows(at: [indexPath], with: .fade) // delete the row from the table view
    }
    
    func addItem(_ item: CellModel) {
        items.insert(item, at: 0) // add the item to your data source
        let indexPath = IndexPath(row: 0, section: 0) // create an index path for the new row
        tableView.insertRows(at: [indexPath], with: .automatic) // insert the new row into the table view
    }

}

