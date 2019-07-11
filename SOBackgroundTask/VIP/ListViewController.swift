//
//  ListViewController.swift
//  SOBackgroundTask
//
//  Created by SOTSYS038 on 03/07/19.
//  Copyright © 2019 SOTSYS038. All rights reserved.
//

import UIKit

protocol ListProtocol: class {
    func getImageCount(count: Double)
}

class ListViewController: UITableViewController {
    
    //MARK: [Ib' Outlat] & [Property]
    var presenter: ListPresenter?
    var arrList: [List]?
    
    //MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: View' Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        
        getData()
        setupNavigationBar()
    }
    
    //MARK: Private [Method]
    private func setup()  {
        let viewcontroller = self
        let interactor =  ListInterator()
        let presenter =  ListPresenter()
        
        interactor.presenter = presenter
        
        self.presenter = presenter
        self.presenter?.interator = interactor
        self.presenter?.viewController = viewcontroller
        
        presenter.setNewData() // SetNew Data
    }
    
    private func setupNavigationBar() {
        let rightBarBtn = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(clearClicked))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        self.title = "Sync Data"
    }
    
    //MARK: Helper
    func getData() {
        arrList = presenter?.fetchData()
    }
}

// MARK: - [Ib' Action]
extension ListViewController {
    @objc func clearClicked() {
        presenter?.clearData()
        presenter?.setNewData()
        getData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Table view data source
extension ListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath)
        let data = arrList?[indexPath.row]
        
        cell.textLabel?.text = "Sync Date: \(data?.date ?? "No Data")"
        cell.detailTextLabel?.text = "Image Count: \(data?.count ?? "No Data")"
        
        return cell
    }
}

//MARK: - ListProtocol
extension ListViewController: ListProtocol {
    func getImageCount(count: Double) {
        print(count)
    }
}
