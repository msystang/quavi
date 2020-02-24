//
//  CategorySelectionViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController {
    //MARK: -- Objects
    lazy var categoryTableView:UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Identifier.categoryCell.rawValue)
        return tableView
    }()
    
    //MARK: -- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureCategoryTableView()
    }
    //MARK: -- private func
    private func addSubviews(){
        view.addSubview(categoryTableView)
    }
    
    private func configureCategoryTableView() {
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoryTableView.topAnchor.constraint(equalTo: view.topAnchor), categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor), categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

extension CategorySelectionViewController: UITableViewDelegate {}
extension CategorySelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.categoryCell.rawValue) as? CategoryTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    
}
