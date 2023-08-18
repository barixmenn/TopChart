//
//  ViewController.swift
//  TopChart2
//
//  Created by MacBookAir on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        NetworkManager.shared.getTurkeyMusic { result in
                    switch result {
                    case .success(let success):

                        print(success)
                    case .failure(let failure):
                        print(failure)
                    }
                }
    }


}

