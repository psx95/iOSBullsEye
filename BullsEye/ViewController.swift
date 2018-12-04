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
        startNewGame()
        // Customizing the slider
        //let thumbImageNormal = UIImage(named: "SliderThumb-Normal")! // name of the image you want to load in the variable
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImagehighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImagehighlighted, for: .highlighted)
        
        // these insets determine what parts of the image are ok to stretch -
        // left - 14 means that we dont want the 14 most points to stretch
        // top - 0 we dont minf if it streteches the top or bottom
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction // connect to something inside the storyboard
    func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference;
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!" + "\nYou get 100 bonus points!!"
            score += 100
        } else if difference == 1 {
            title = "Just 1 off!!" + "\nYou get 50 bonus points!!"
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
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            // this is called a closure in iOS (a method without a name, kind of like promise in JS)
            action in self.startNewRound()
        })
        // tell the alert to add the button to itself
        alert.addAction(action)
        // present the alert on the screen
        present(alert, animated: true, completion: nil)
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
    
    @IBAction func startNewGame () {
        score = 0
        rounds = 0
        startNewRound()
    }
    
}

