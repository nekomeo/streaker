//
//  SecondViewController.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import UIKit

class SecondViewController: UICollectionViewController {
    
    fileprivate let reuseIdentifier = "TrophyCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    let trophies:[Trophy] = [Trophy(image: #imageLiteral(resourceName: "launchscreen"), title: "Trophy 1"),
                             Trophy(image: #imageLiteral(resourceName: "launchscreen"), title: "Trophy 2"),
                             Trophy(image: #imageLiteral(resourceName: "launchscreen"), title: "Trophy 3"),
                             Trophy(image: #imageLiteral(resourceName: "launchscreen"), title: "Trophy 4"),
                             Trophy(image: #imageLiteral(resourceName: "launchscreen"), title: "Trophy 5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SecondViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trophies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! TrophyCell
        
        let trophyPhoto = trophies[indexPath.row].image
        cell.backgroundColor = UIColor.white

        cell.trophyImage.image = trophyPhoto
        cell.trophyLabel.text = trophies[indexPath.row].title
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "TrophyViewHeaderView",
                                                                             for: indexPath) as! TrophyViewHeaderView
            headerView.headerTitle.text = "Hall of Victory"
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

