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
    
    let trophies:[Trophy] = [Trophy(image: #imageLiteral(resourceName: "trophy4"), title: "Week of Zen"),
                             Trophy(image: #imageLiteral(resourceName: "trophy2"), title: "Building Blocks"),
                             Trophy(image: #imageLiteral(resourceName: "trophy3"), title: "Enlightenment"),
                             Trophy(image: #imageLiteral(resourceName: "trophy1"), title: "Nirvana")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        cell.backgroundColor = UIColor.clear

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
            headerView.headerTitle.text = "Steps to Enlightenment"
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
    
        let paddingSpace = (sectionInsets.left * (itemsPerRow + 1)) - 10
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

