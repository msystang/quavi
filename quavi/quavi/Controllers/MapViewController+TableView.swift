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
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
            
            //TO-DO: SEPERATE INTO IT'S OWN FILE
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
            button.setTitle(sampleData[section].name, for: .normal)
            button.backgroundColor = .systemYellow
            button.addTarget(self, action: #selector(tvCellSectionButtonPressed(sender:)), for: .touchDown)
            button.setTitleColor(.black, for: .normal)
            button.tag = section
            view.addSubview(button)
            
            view.backgroundColor = .clear
            return view
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 50 }
    
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
