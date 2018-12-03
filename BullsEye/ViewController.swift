//
//  ViewController.swift
//  BullsEye
//
//  Created by Pranav Sharma on 01/12/18.
//  Copyright © 2018 Pranav Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0 // type inference (can figure out type of variable acc to initial value you set)
    var rounds = 0;
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetDisplay: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    @IBOutlet weak var roundDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        startNewRound()
    }
    
    @IBAction // connect to something inside the storyboard
    func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference;
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!" + "\nYou get 100 bonus Points!!"
            score += 100
        } else if difference == 1 {
            title = "Just 1 off!!" + "\nYou get 50 bonus Points!!"
            score += 50
        } else if difference < 5 {
            title = "You almost had it !"
        } else if difference < 10 {
            title = "Pretty Good .."
        } else {
            title = "Not even close !"
        }
        let message = "You scored \(points) points!" +
        "\nYour Total Score till now is \(score)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        // UIAlretAction - the button that appears inside the alert
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        // tell the alert to add the button to itself
        alert.addAction(action)
        // present the alert on the screen
        present(alert, animated: true, completion: nil)
        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        print("The value of the slider is now: \(currentValue)")
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50;
        slider.value = Float(currentValue)
        rounds += 1
        updateLabels()
    }
    
    func updateLabels() {
        scoreDisplay.text = "\(score)"
        targetDisplay.text = "\(targetValue)"
        roundDisplay.text = String(rounds) // another way of using Strings
    }
}

