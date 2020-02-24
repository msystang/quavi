//
//  CategorySelectionViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController {
    
    //MARK: -- Properties
    var layout = UICollectionViewFlowLayout.init()
    
    //MARK: -- Objects
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.categoryCell.rawValue)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: -- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureCategoryCollectionView()
    }
    //MARK: -- private func
    private func addSubviews(){
        view.addSubview(categoryCollectionView)
    }
    
    private func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Tour Categories"
    }
    
    private func configureCategoryCollectionView() {
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor), categoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor), categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor), categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

extension CategorySelectionViewController: UICollectionViewDelegate{}

extension CategorySelectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.categoryCell.rawValue, for: indexPath) as? CatergoryCollectionViewCell else {return UICollectionViewCell()}
        
        return cell
    }
}
