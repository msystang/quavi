//
//  POIPopUpGallery.swift
//  quavi
//
//  Created by Alex 6.1 on 3/3/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIPopUpGallery: UIView {
    
    let padding: CGFloat = 20
    lazy var poiGalleryCollectionView = POIPopUpGalleryCollectionView()
    
    var poiImageUrls = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIDesign.quaviLightGrey
        
        poiGalleryCollectionView.delegate = self
        poiGalleryCollectionView.dataSource = self
        poiGalleryCollectionViewContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func poiGalleryCollectionViewContraints() {
        addSubview(poiGalleryCollectionView)
        poiGalleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poiGalleryCollectionView.topAnchor.constraint(equalTo: topAnchor),
            poiGalleryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            poiGalleryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            poiGalleryCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor)
            //poiGalleryCollectionView.widthAnchor.constraint(equalToConstant: 300),
            //poiGalleryCollectionView.heightAnchor.constraint(equalToConstant: poiGalleryCollectionView.contentSize.height)
        ])
    }
    
}

extension POIPopUpGallery: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return poiImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = poiGalleryCollectionView.dequeueReusableCell(withReuseIdentifier: POIPopUpGalleryCollectionViewCell.reuseID, for: indexPath) as! POIPopUpGalleryCollectionViewCell
        
        //TODO: HANDLE IMAGES
        let currentImgUrl = poiImageUrls[indexPath.row]
        
        cell.poiGalleryImageView.image = UIImage(named: "moMath2")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(frame.size.width - 10), height: (frame.size.height)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let transformation = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        cell.layer.transform = transformation
        cell.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}
