//
//  StreakProgressView.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import Foundation
import UIKit

class StreakProgressView: UIProgressView {
    
    override func setProgress(_ progress: Float, animated: Bool) {
        self.progress = progress
        if animated {
            let duration = TimeInterval(2.0)
            let delay = TimeInterval(0.4)
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
                self.layoutIfNeeded()
                }, completion: nil)
        } else {
            self.layoutIfNeeded()
        }
    }
}
