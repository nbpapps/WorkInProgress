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
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTableView()
        
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
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = .systemBackground
        tableView.register(IntradayTableViewCell.self, forCellReuseIdentifier: IntradayTableViewCell.reuseId)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func getIntradayData() {
        
    }
}


extension IntradayViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IntradayTableViewCell.reuseId, for: indexPath) as? IntradayTableViewCell else {
            preconditionFailure(Strings.shared.incorrectCell)
        }
        
        cell.textLabel?.text = "NIV"
        return cell
    }
    
    
}
