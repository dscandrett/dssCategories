//
//  ViewController.swift
//  dssCategories
//
//  Created by Doug on 3/22/15.
//  Copyright (c) 2015 dssDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dss_showErrorAlert(NSError.dss_errorWithDomain("com.test.testing", code: 420, localizedDescription:"Hello! This is an test error."));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

