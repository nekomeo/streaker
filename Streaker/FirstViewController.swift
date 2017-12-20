//
//  FirstViewController.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import UIKit
import UICountingLabel

class FirstViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var streak: UICountingLabel!
    
    
    let emitter = CAEmitterLayer()
    
    let goal = 5000.00
    let saved = 2000.00
    let daysStreaked = 20
    let quote = "It's hard to make up quotes after hours of hacking"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0.0, animated: false)
        goalLabel.text = "🤔"
        savedLabel.text = "🤔"
        quoteText.text = "Tap the streak circle to update your streak 👆"
        streak.text = "↻"
        
        let swipeControl = UISwipeGestureRecognizer(target: self, action: #selector(self.refreshUI))
        swipeControl.direction = .down
        self.view.addGestureRecognizer(swipeControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func refreshUI() {
        progressView.setProgress(0, animated: false)
        progressView.setProgress(Float(saved/goal), animated: true)
        goalLabel.text = "Goal: $\(goal)"
        savedLabel.text = "Saved: $\(saved)"
        quoteText.text = quote
        
        streak.method = .easeIn
        streak.formatBlock = { (value: CGFloat) -> String in do {
            let intVal = Int(value)
            return "\(intVal)"
            }
        }
        streak.countFromZero(to: CGFloat(self.daysStreaked))
    }
}

