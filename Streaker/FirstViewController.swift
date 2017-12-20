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
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var streak: UICountingLabel!
    
    
    let emitter = CAEmitterLayer()
    
    let goal = 500.00
    let saved = 200.00
    let daysStreaked = 20
    let quote = "The journey of a thousand miles begins with a single step."
    
    let viewModel = FirstViewControllerViewModel()
    let bag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0.0, animated: false)
        goalLabel.text = ""
        savedLabel.text = ""
        quoteText.text = "Tap the streak circle to update your streak."
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
        launchTrophyModal()
        viewModel.getStreaks()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
            [weak self]streaksFromDynamo in
            if let streaksFromDynamo = streaksFromDynamo {
                self?.progressView.setProgress(0, animated: false)
                self?.quoteText.text = self?.quote
                self?.streak.method = .easeIn
                self?.streak.formatBlock = { (value: CGFloat) -> String in do {
                    let intVal = Int(value)
                    return "\(intVal)"
                    }
                }
                if let streakFromDynamo = streaksFromDynamo._streak{
                    self?.streak.countFromZero(to: CGFloat(truncating: streakFromDynamo))
                    if let goal = self?.goal, var saved = self?.saved{
                        
                        saved = saved + ((streaksFromDynamo._streak?.doubleValue)! * 10)
                        
                        self?.progressView.setProgress(Float(saved/goal), animated: true)
                        let goalAmt = String(format: "$%.02f", goal)
                        let savedAmt = String(format: "$%.02f", saved)
                        self?.goalLabel.text = "Goal: \(goalAmt)"
                        self?.savedLabel.text = "Saved: \(savedAmt)"
                    }
                }
                
            }
        }).disposed(by: bag)
    
    }
    
    func createGradientOnView(view: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint.zero;
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func launchTrophyModal() {
        let vc = (
            storyboard?.instantiateViewController(
                withIdentifier: "TrophyModal")
            )!
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
}

