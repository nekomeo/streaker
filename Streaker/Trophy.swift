//
//  Trophy.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import Foundation
import UIKit

struct Trophy {
    var image: UIImage = #imageLiteral(resourceName: "first")
    var title: String = "Trophy Title"
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}
