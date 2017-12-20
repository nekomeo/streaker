//
//  TrophyModalViewController.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/20/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import Foundation
import UIKit

class TrophyModalViewController: UIViewController {
    
    
    @IBOutlet weak var animatedImage: UIImageView!
    
    @IBAction func dismissButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
