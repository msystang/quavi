//
//  MapViewController+TableView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import  UIKit
import Kingfisher

//MARK: -EXT. TABLEVIEW DELEGATE & DATASOURCE
extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedSections.contains(section) {
            return 1
        }else {
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return poiForTour.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        
        //TO-DO: SEPERATE INTO IT'S OWN FILE
        
        let overLayView =  UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
               overLayView.backgroundColor = UIDesign.quaviYellow
         let button = UIButton(frame: CGRect(x: 62, y: 0, width: self.view.frame.width - 62, height: 70))
        button.setTitle(poiForTour[section].name, for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIDesign.quaviYellow
        button.addTarget(self, action: #selector(tvCellSectionButtonPressed(sender:)), for: .touchDown)
        button.setTitleColor(.black, for: .normal)
        button.tag = section
        view.addSubview(overLayView)
        view.addSubview(button)
        
        let sectionImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        sectionImage.layer.cornerRadius = sectionImage.frame.height / 2
        sectionImage.layer.masksToBounds = true
        
        //This is the kingfisher code for the section if you guys dont like the fade in, the just delete the options: [.transition(.fade(0.2))].. its an optional so its not required not will it mess with the code
        let imgUrlLStr = poiForTour[section].tableViewImage
        sectionImage.kf.indicatorType = .activity
        sectionImage.kf.setImage(with: URL(string: imgUrlLStr), placeholder: UIDesign.placeholderImage, options: [.transition(.fade(0.2))])
        
        button.addSubview(sectionImage)
        
        
        let sectionHeaderArrows = UIImageView(image: UIImage(systemName: "chevron.compact.down"))
        sectionHeaderArrows.tintColor = .black
        button.addSubview(sectionHeaderArrows)
        
        constrainTVSectionArrow(button: button, sectionHeaderArrows: sectionHeaderArrows)
        constrainTVSectionImage(button: button, sectionHeaderImage: sectionImage, view: view)
        
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stop = poiForTour[indexPath.section]
        
        guard let cell = poiTableView.dequeueReusableCell(withIdentifier: Enums.cellIdentifiers.StopCell.rawValue, for: indexPath) as? StopsTableViewCell else { return UITableViewCell() }
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
        cell.backgroundColor = .clear
        
        cell.stopImage.kf.indicatorType = .activity
        cell.stopImage.kf.setImage(with: URL(string: stop.tableViewImage), placeholder: UIDesign.placeholderImage, options: [.transition(.fade(0.2))])
        cell.stopLabel.text = stop.shortDesc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
}
