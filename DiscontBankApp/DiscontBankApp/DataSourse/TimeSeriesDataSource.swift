//
//  TimeSeriesDataSource.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class TimeSeriesDataSource: NSObject, UITableViewDataSource {
   
    private var timeSerise : [String] = ["sdhfs","asjhda"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSerise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IntradayTableViewCell.reuseId, for: indexPath) as? IntradayTableViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        cell.textLabel?.text = timeSerise[indexPath.row]
        
        return cell
    
    }
    

}
