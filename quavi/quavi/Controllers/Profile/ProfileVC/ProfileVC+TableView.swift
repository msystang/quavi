//
//  ProfileVC+TableView.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if faveTypeSegmentControl.selectedSegmentIndex == 0 {
        return toursTest.count
            
        } else if faveTypeSegmentControl.selectedSegmentIndex == 1 {
            if sampleData[section].isCellExpanded == false { return 0 } else { return 1 }
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if faveTypeSegmentControl.selectedSegmentIndex == 1{
            return sampleData.count
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if faveTypeSegmentControl.selectedSegmentIndex == 1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
            button.setTitle(sampleData[section].name, for: .normal)
            button.backgroundColor = .systemYellow
            button.addTarget(self, action: #selector(tvCellSectionButtonPressed(sender:)), for: .touchDown)
            button.setTitleColor(.black, for: .normal)
            button.tag = section
            view.addSubview(button)

            let sectionImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            sectionImage.layer.cornerRadius = sectionImage.frame.height / 2
            sectionImage.layer.masksToBounds = true
            sectionImage.image = sampleData[section].popoverImage


            let sectionHeaderArrows = UIImageView(image: UIImage(systemName: "chevron.compact.down"))
            sectionHeaderArrows.tintColor = .black
            button.addSubview(sectionHeaderArrows)
            button.addSubview(sectionImage)
            constrainTVSectionArrow(button: button, sectionHeaderArrows: sectionHeaderArrows)
            constrainTVSectionImage(button: button, sectionHeaderImage: sectionImage)

            view.backgroundColor = .clear
            return view
        }
        return nil
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if faveTypeSegmentControl.selectedSegmentIndex == 0 {
        guard let tourCell = tableView.dequeueReusableCell(withIdentifier: Enums.cellIdentifiers.faveTourCell.rawValue, for: indexPath) as? FaveToursCell else {return UITableViewCell()}
            
            tourCell.tourName.text = toursTest[indexPath.row]
            tourCell.tourImage.image = UIImage(systemName: "ant")
            tourCell.backgroundColor = .systemRed
            
            return tourCell
        } else if faveTypeSegmentControl.selectedSegmentIndex == 1 {
            let stop = sampleData[indexPath.section]
            
            guard let poiCell = tableView.dequeueReusableCell(withIdentifier: Enums.cellIdentifiers.favePOICell.rawValue, for: indexPath) as? FavePOICell else {
                return UITableViewCell()
                
            }
            
            UIView.animate(
                withDuration: 0.3,
                delay: 0.05 * Double(indexPath.row),
                animations: {
                    poiCell.alpha = 1
            })
            poiCell.backgroundColor = .clear
            poiCell.poiImage.image = stop.tableViewImage
            poiCell.poiName.text = stop.shortDesc
            
            return poiCell
        }
        return UITableViewCell()
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if faveTypeSegmentControl.selectedSegmentIndex == 1 {
            return 70
        }
        return 0
    }

    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if faveTypeSegmentControl.selectedSegmentIndex == 1 {
            return 200
        }
        return 70
    }
    
    
    
    
    @objc func tvCellSectionButtonPressed(sender: UIButton) {
        print(sender.tag)

        if sampleData[sender.tag].isCellExpanded {
            sampleData[sender.tag].isCellExpanded = false
            
        } else {
            sampleData[sender.tag].isCellExpanded = true
        }
        let incides: IndexSet = [sender.tag]
        faveTourTableView.reloadSections(incides, with: .fade)
    }
}
