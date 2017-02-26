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
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView.contentMode = .scaleAspectFit
        imageView.image = self.view.snapshotImage
        
    }

    @IBAction func logoutClicked(_ sender: Any) {
        try! FIRAuth.auth()!.signOut()
        //didLogout()
    }
    
    @IBAction func ytViewControllerClicked(_ sender: Any) {
        self.navigationController?.pushViewController( UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YouTubeViewController"), animated: true)
    }
}

