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
    let tourNameArray = ["History", "Art", "Science", "Religion", "Bars", "Yeet", "Zoo", "Parks", "Best Dollar Pizza"]
    let numberOfTours = [4,6,7,3,2,8,6,3,20]
    
    var layout = UICollectionViewFlowLayout.init()
    //MARK: -- Objects
    lazy var categoryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(CatergoryCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.categoryCell.rawValue)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
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

    }
    //MARK: -- private func
    private func addSubviews(){
        view.addSubview(categoryCollectionView)
    }
    
    private func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Tour Categories"
    }
}
