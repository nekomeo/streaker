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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var logoImages: [UIImage] = []
        logoImages.append(UIImage(named: "Comp 1_00000.png")!)
        logoImages.append(UIImage(named: "Comp 1_00001.png")!)
        logoImages.append(UIImage(named: "Comp 1_00002.png")!)
        logoImages.append(UIImage(named: "Comp 1_00003.png")!)
        logoImages.append(UIImage(named: "Comp 1_00004.png")!)
        logoImages.append(UIImage(named: "Comp 1_00005.png")!)
        logoImages.append(UIImage(named: "Comp 1_00006.png")!)
        logoImages.append(UIImage(named: "Comp 1_00007.png")!)
        logoImages.append(UIImage(named: "Comp 1_00008.png")!)
        logoImages.append(UIImage(named: "Comp 1_00009.png")!)
        logoImages.append(UIImage(named: "Comp 1_00010.png")!)
        logoImages.append(UIImage(named: "Comp 1_00011.png")!)
        logoImages.append(UIImage(named: "Comp 1_00012.png")!)
        logoImages.append(UIImage(named: "Comp 1_00013.png")!)
        logoImages.append(UIImage(named: "Comp 1_00014.png")!)
        logoImages.append(UIImage(named: "Comp 1_00015.png")!)
        logoImages.append(UIImage(named: "Comp 1_00016.png")!)
        logoImages.append(UIImage(named: "Comp 1_00017.png")!)
        logoImages.append(UIImage(named: "Comp 1_00018.png")!)
        logoImages.append(UIImage(named: "Comp 1_00019.png")!)
        logoImages.append(UIImage(named: "Comp 1_00020.png")!)
        logoImages.append(UIImage(named: "Comp 1_00021.png")!)
        logoImages.append(UIImage(named: "Comp 1_00022.png")!)
        logoImages.append(UIImage(named: "Comp 1_00023.png")!)
        logoImages.append(UIImage(named: "Comp 1_00024.png")!)
        logoImages.append(UIImage(named: "Comp 1_00025.png")!)
        logoImages.append(UIImage(named: "Comp 1_00026.png")!)
        logoImages.append(UIImage(named: "Comp 1_00027.png")!)
        logoImages.append(UIImage(named: "Comp 1_00028.png")!)
        logoImages.append(UIImage(named: "Comp 1_00029.png")!)
        logoImages.append(UIImage(named: "Comp 1_00030.png")!)
        logoImages.append(UIImage(named: "Comp 1_00031.png")!)
        logoImages.append(UIImage(named: "Comp 1_00032.png")!)
        
        
        animatedImage.animationImages = logoImages
        animatedImage.animationDuration = 0.5
        animatedImage.animationRepeatCount = 1
        animatedImage.startAnimating()
    }
    
}
