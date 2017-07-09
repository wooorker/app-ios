//
//  ViewController.swift
//  SmartWork
//
//  Created by apple on 2017/5/30.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        SWApiGetProvider.request(.test) { result in
            if case let .success(response) = result {

                
                let jsonString = try? response.mapJSON() as!NSDictionary

                print(jsonString ?? "ca")
            }
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

