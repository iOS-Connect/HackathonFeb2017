//
//  ProfileListViewController.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class ProfileListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var montages: [Montage] = [Montage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)

        guard let userId = UserDefaults.standard.value(forKey: AppDelegate.Constants.userId) as? String else {
            fatalError("no userId found")
        }
        
        FirebaseService.shared.fetchMontages(user_id: userId) { (montages, err) in
            if err != nil {
                //TODO handle
                print(err!)
            } else {
                self.montages = montages
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileClipCell.identifier, for: indexPath) as! ProfileClipCell
        cell.montage = montages[indexPath.item]
        cell.constraint.constant = UIScreen.main.bounds.size.width
        cell.updateUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return montages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIViewController.instantiate(controllerType: DetailViewController.self)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
