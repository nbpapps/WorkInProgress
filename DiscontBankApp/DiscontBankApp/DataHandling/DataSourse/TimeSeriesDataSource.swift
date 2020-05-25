//
//  TimeSeriesDataSource.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class TimeSeriesDataSource: NSObject, UITableViewDataSource {
    
    typealias fetchCompletion = (_ error : Error?,_ success : Bool ) -> Void
    
    private var timeSeriesArray : [TimeSeriesValues]?
    
    //MARK:- retrive data
    func fetchIntradayData(for symbol : String, and timeInterval : String,with completion : @escaping fetchCompletion) {
        let key = symbol + timeInterval
//        print(key)
        //check if we already have a saved time series for this key
        if let timeSeriesArray = TimeSeriesData.shared.timeSeriesArray(for: key) {
            //if so, just retrive it so we don't make a new network request
            self.timeSeriesArray = timeSeriesArray
            completion(nil,true)
        }else{
            //if not, fetch this time series
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSeriesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IntradayTableViewCell.reuseId, for: indexPath) as? IntradayTableViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        guard let timeSeries = timeSeriesArray?[indexPath.row] else {
            preconditionFailure(Strings.noItemInRow)
        }
        
        cell.timeView.update(title: Strings.timeTitle, value: timeSeries.time.extractTimeFromDate(), textColor: .timeColor)
        cell.openView.update(title: Strings.openTitle, value: timeSeries.open, textColor: .openColor)
        cell.highView.update(title: Strings.highTitle, value: timeSeries.high, textColor: .highColor)
        cell.lowView.update(title: Strings.lowTitle, value: timeSeries.low, textColor: .lowColor)
        cell.closeView.update(title: Strings.closeTitle, value: timeSeries.close, textColor: .closeColor)
        cell.volumeView.update(title: Strings.volumeTitle, value: timeSeries.volume, textColor: .volumeColor)
        
        return cell
    }
}
