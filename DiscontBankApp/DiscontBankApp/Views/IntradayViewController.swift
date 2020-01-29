//
//  IntradayViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class IntradayViewController: UIViewController {

    var bank : Bank!
    let timeSeriesDataSource = TimeSeriesDataSource()

    var timeSeriesTableView : UITableView!
    var timeIntervalSelectionSegmentControl : DBASegmentControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        configureTimeIntervalSegments()
        getIntradayData(for: bank.stk, and: Strings.defualtInterval)
    }
    
    //MARK: - layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            timeIntervalSelectionSegmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Values.buttonPadding),
            timeIntervalSelectionSegmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.buttonPadding),
            timeIntervalSelectionSegmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Values.buttonPadding),
            timeIntervalSelectionSegmentControl.heightAnchor.constraint(equalToConstant: 44.0),
            
            timeSeriesTableView.topAnchor.constraint(equalTo: timeIntervalSelectionSegmentControl.bottomAnchor, constant: Values.intraDayTableViewPadding),
            timeSeriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.intraDayTableViewPadding),
            timeSeriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Values.intraDayTableViewPadding),
            timeSeriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Values.intraDayTableViewPadding)
        
        ])
    }
    
    //MARK:- configure
    func configureView() {
        title = bank.name
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        timeSeriesTableView = UITableView(frame: view.bounds, style: .plain)
        timeSeriesTableView.backgroundColor = .systemBackground
        timeSeriesTableView.register(IntradayTableViewCell.self, forCellReuseIdentifier: IntradayTableViewCell.reuseId)
        timeSeriesTableView.dataSource = timeSeriesDataSource
        
        timeSeriesTableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(timeSeriesTableView)
    }

    
    func configureTimeIntervalSegments() {
        let allTimeIntevals = TimeIntervals().getAllIntervalOptions()
        timeIntervalSelectionSegmentControl = DBASegmentControl(items: allTimeIntevals)
        timeIntervalSelectionSegmentControl.addTarget(self, action: #selector(userSelectedTimeInterval(sender:)), for: .valueChanged)
        view.addSubview(timeIntervalSelectionSegmentControl)
    }
    

    
    //MARK:- get Intraday data
    func getIntradayData(for symbol : String, and timeInterval : String) {
        timeSeriesDataSource.fetchIntradayData(for: symbol, and: timeInterval) {
            DispatchQueue.main.async {
                self.timeSeriesTableView.reloadData()
            }
        }
    }
    
    
    
    //MARK:- time intervall segment control
    @objc func userSelectedTimeInterval(sender : DBASegmentControl) {
//        print(sender.selectedSegmentIndex)
        let timeInterval = TimeIntervals().getInterval(at: sender.selectedSegmentIndex)
        getIntradayData(for: bank.stk, and: timeInterval)
    }
    
}

