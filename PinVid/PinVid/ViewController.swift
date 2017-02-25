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
        
        let montage1 = Montage()
        montage1.author = "Kei Sakaguchi"
        montage1.desc = "This is a test."
        montage1.title = "Kei goes to Dev Camp!"
        montage1.montage_id = "1234ABCD"

        let montage2 = Montage()
        montage2.author = "Max"
        montage2.desc = "This is another test."
        montage2.title = "MAX!"
        montage2.montage_id = "1111AAAA"
        
        Montage.addMontage(montage: montage1, user_id: "KEI123") { error in
            if error != nil {
                print("fail")
                return
            }
            print("yay, it worked")
        }
        
        Montage.addMontage(montage: montage2, user_id: "MAX123") { error in
            if error != nil {
                print("fail")
                return
            }
            print("yay, it worked")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

