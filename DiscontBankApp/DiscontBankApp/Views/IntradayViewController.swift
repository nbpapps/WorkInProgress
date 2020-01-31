//
//  IntradayViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class IntradayViewController: UIViewController {

    var bank : Bank!
    let timeSeriesDataSource = TimeSeriesDataSource()

    var timeSeriesTableView : UITableView!
    var timeIntervalSelectionSegmentControl : DBASegmentControl!
    
    let loadingViewController = LoadingViewController()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        configureTimeIntervalSegments()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        showLoading()
        timeSeriesDataSource.fetchIntradayData(for: symbol, and: timeInterval) { (error,success) in      DispatchQueue.main.async {
                self.timeSeriesTableView.reloadData()
                self.removeLoading()
            }
        }
    }
    
    //MARK:- time intervall segment control
    @objc func userSelectedTimeInterval(sender : DBASegmentControl) {
        let timeInterval = TimeIntervals().getInterval(at: sender.selectedSegmentIndex)
        getIntradayData(for: bank.stk, and: timeInterval)
    }
    
    //MARK:- loading
    func showLoading() {
        view.alpha = 0.7
        add(loadingViewController)
    }

    func removeLoading() {
        view.alpha = 1.0
        self.loadingViewController.remove()
    }
}

