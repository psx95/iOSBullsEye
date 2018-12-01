//
//  ViewController.swift
//  BullsEye
//
//  Created by Pranav Sharma on 01/12/18.
//  Copyright © 2018 Pranav Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction // connect to something inside the storyboard
    func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "This is not my first app", preferredStyle: .alert);
        // UIAlretAction - the button that appears inside the alert
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        // tell the alert to add the button to itself
        alert.addAction(action)
        // present the alert on the screen
        present(alert, animated: true, completion: nil)
    }
    
}

