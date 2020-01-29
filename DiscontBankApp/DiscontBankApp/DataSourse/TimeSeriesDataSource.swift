//
//  TimeSeriesDataSource.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class TimeSeriesDataSource: NSObject, UITableViewDataSource {
   
//    typealias fetchCompletion = () -> Void
    typealias fetchCompletion = (_ error : Error?,_ success : Bool ) -> Void

    private var timeSeriesArray : [TimeSeriesValues]?
        
    //MARK:- retrive data
    public func fetchIntradayData(for symbol : String, and timeInterval : String,with completion : @escaping fetchCompletion) {
        let key = symbol + timeInterval

        if let timeSeriesArray = TimeSeriesData.shared.timeSeriesArray(for: key) {
            self.timeSeriesArray = timeSeriesArray
            completion(nil,true)
        }else{
            let dataFetch = DataFetch()
            dataFetch.fetchTimeSeriesIntraday(for: symbol, and: timeInterval) { [weak self] (result) in
                self?.parse(result: result, with: completion, for: symbol, and: timeInterval)
            }
        }
    }
    
    private func parse(result : Result<Data, NetworkError>,with completion : @escaping fetchCompletion,for symbol : String,and timeInterval :String) {
        switch result {
        case .success(let networkData):
            let dataParser = DataParser(data: networkData)
            let timeSeiresResults = dataParser.decode(with: timeInterval)
            extractTimeSeriesFrom(result: timeSeiresResults, with: completion, for: symbol+timeInterval)
        case .failure(let error):
            print("parse \(error)")
            completion(error,false)
        }
    }
    
    private func extractTimeSeriesFrom(result : Result<[TimeSeriesValues], DataParseError>,with completion : @escaping fetchCompletion,for key : String) {
        switch result {
        case .success(let timeSerise):
            if !timeSerise.isEmpty {
                TimeSeriesData.shared.save(timeSeriesArray: timeSerise, forKey: key)
                self.timeSeriesArray = timeSerise
            }else{
                self.timeSeriesArray = []
            }
            
            completion(nil,true)
            
        case .failure(let error):
            print("extractTimeSeriesFrom \(error)")
            completion(error,false)
        }
    }
    
    
    
    
    //MARK:- table view
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSeriesArray?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IntradayTableViewCell.reuseId, for: indexPath) as? IntradayTableViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        guard let timeSeries = timeSeriesArray?[indexPath.row] else {
            preconditionFailure(Strings.noItemInRow)
        }
        
        cell.timeValueLabel.text = timeSeries.time.extractTimeFromDate()
        cell.openValueLabel.text = timeSeries.open
        cell.highValueLabel.text = timeSeries.high
        cell.lowValueLabel.text = timeSeries.low
        cell.closeValueLabel.text = timeSeries.close
        cell.volumeValueLabel.text = timeSeries.volume
        
        return cell
    }
    

}
