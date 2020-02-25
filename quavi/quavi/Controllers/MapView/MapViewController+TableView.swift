//
//  MapViewController+TableView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import  UIKit

//MARK: -EXT. TABLEVIEW DELEGATE & DATASOURCE
extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sampleData[section].isCellExpanded == false { return 0 } else { return 1 }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int { return sampleData.count }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if currentSelectedCategory == Enums.categories.History.rawValue {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
            
            //TO-DO: SEPERATE INTO IT'S OWN FILE
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 70 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stop = sampleData[indexPath.section]
        
        guard let cell = poiTableView.dequeueReusableCell(withIdentifier: Enums.cellIdentifiers.StopCell.rawValue, for: indexPath) as? StopsTableViewCell else { return UITableViewCell() }
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
        cell.backgroundColor = .clear
        cell.stopImage.image = stop.tableViewImage
        cell.stopLabel.text = sampleData[indexPath.section].shortDesc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
}