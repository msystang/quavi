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
            return poiTest.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "faveCell") as? FaveToursCell {
            if faveTypeSegmentControl.selectedSegmentIndex == 0 {
                cell.tourName.text = toursTest[indexPath.row]
                
            } else if faveTypeSegmentControl.selectedSegmentIndex == 1 {
                cell.tourName.text = poiTest[indexPath.row]
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
