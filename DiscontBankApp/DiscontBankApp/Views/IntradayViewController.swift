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
    
    var timeSeriesTableView : UITableView!
    let timeSeriesDataSource = TimeSeriesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
        getIntradayData(for: bank.stk, and: Strings.defualtInterval)
    }
    
    //MARK: - layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Values.shared.intraDayTableViewPadding),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.shared.intraDayTableViewPadding),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Values.shared.intraDayTableViewPadding),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Values.shared.intraDayTableViewPadding)
//        
//        ])
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
        timeSeriesTableView.dataSource = self
        view.addSubview(timeSeriesTableView)
    }
    
    //MARK:- get Intraday data
    func getIntradayData(for symbol : String, and timeInterval : String) {
        let dataFetch = DataFetch()
        dataFetch.fetchTimeSeriesIntraday(for: symbol, and: timeInterval) { (result) in
            switch result {
            case .success(let networkData):
                let dataParser = DataParser(data: networkData)
                dataParser.decode()
            case .failure(let networkError):
                print(networkError)
            }
        }
    }
}


extension IntradayViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IntradayTableViewCell.reuseId, for: indexPath) as? IntradayTableViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        cell.textLabel?.text = "NIV"
        return cell
    }
    
    
}
