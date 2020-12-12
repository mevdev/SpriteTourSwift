//
//  MenuViewController.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import UIKit

class MenuViewController: UIViewController {

    var tableView: UITableView?
    var cells = [String]()
    
    override func viewDidLoad() {
        self.title = "SpriteKit Tour"
        
        self.setupCellData()
        let menuTableView = UITableView()
        self.view.addSubview(menuTableView)
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.tableFooterView = UIView()
        self.tableView = menuTableView
    }
    
    func setupCellData() {
        cells.append("Basic")
        cells.append("Colorized")
        cells.append("Animated Color")
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ViewController()
        vc.indexSelected = indexPath.row
        vc.sceneTitle = self.cells[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

        self.tableView?.deselectRow(at: indexPath, animated: true)
    }
}

extension MenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "spriteTourCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "spriteTourCell")
            cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        cell!.textLabel?.text = self.cells[indexPath.row]
        return cell!
    }
    
}
