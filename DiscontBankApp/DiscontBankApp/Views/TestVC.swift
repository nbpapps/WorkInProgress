//
//  TestVC.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/02/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    let myView = IntradayItemInfoView(frame: .zero)
    let secView = IntradayItemInfoView(frame: .zero)

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NSLayoutConstraint.activate([
//
//            myView.
//
//        ])
        
        // Do any additional setup after loading the view.
        
        
        let stack = UIStackView(arrangedSubviews: [myView,secView])
        stack.axis = .vertical
        stack.distribution = .fill
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

            
            
            NSLayoutConstraint.activate([

                stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: view.trailingAnchor)

            ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myView.update(title: "er", value: "sdfsdf", textColor: .green)
        secView.update(title: "ihdiuash", value: "sidufhiu", textColor: .orange)

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
