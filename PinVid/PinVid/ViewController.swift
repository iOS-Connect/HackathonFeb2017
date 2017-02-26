//
//  ViewController.swift
//  PinVid
//
//  Created by YupinHuPro on 2/24/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutClicked(_ sender: Any) {
        try! FIRAuth.auth()!.signOut()
        //didLogout()
    }

}

