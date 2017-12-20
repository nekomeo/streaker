//
//  FirstViewController.swift
//  Streaker
//
//  Created by AJ Kueterman on 12/19/17.
//  Copyright © 2017 AJ Kueterman. All rights reserved.
//

import UIKit
import UICountingLabel
import RxSwift

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
    
    let viewModel = FirstViewControllerViewModel()
    let bag = DisposeBag()
    
    
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
        
        let tapControl = UITapGestureRecognizer(target: self, action: #selector(self.refreshUI))
        tapControl.numberOfTapsRequired = 1
        streak.addGestureRecognizer(tapControl)
        streak.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func refreshUI() {
        
        viewModel.getStreaks()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
            [weak self]streaksFromDynamo in
            if let streaksFromDynamo = streaksFromDynamo {
                self?.progressView.setProgress(0, animated: false)
                if let goal = self?.goal, let saved = self?.saved{
                    self?.progressView.setProgress(Float(saved/goal), animated: true)
                    self?.goalLabel.text = "Goal: $\(goal)"
                    self?.savedLabel.text = "Saved: $\(saved)"

                }
                self?.quoteText.text = self?.quote
                self?.streak.method = .easeIn
                self?.streak.formatBlock = { (value: CGFloat) -> String in do {
                    let intVal = Int(value)
                    return "\(intVal)"
                    }
                }
                if let streakFromDynamo = streaksFromDynamo._streak{
                    self?.streak.countFromZero(to: CGFloat(streakFromDynamo))
                }
                
            }
        }).disposed(by: bag)
        

    }
}

