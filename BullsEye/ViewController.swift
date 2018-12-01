//
//  ViewController.swift
//  BullsEye
//
//  Created by Pranav Sharma on 01/12/18.
//  Copyright © 2018 Pranav Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetDisplay: UILabel!
    
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
        let message = "The value of the slider is now: \(currentValue)" +
        "\nThe target Value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert);
        // UIAlretAction - the button that appears inside the alert
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.startNewRound()})
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
        targetDisplay.text = "\(targetValue)"
    }
}

