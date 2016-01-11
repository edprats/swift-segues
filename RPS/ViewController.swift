//
//  ViewController.swift
//  RPS
//
//  Created by Eduardo Prats on 1/9/16.
//  Copyright © 2016 edprats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rockButtonPressed(sender: AnyObject) {
        self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController")
        performSegueWithIdentifier("resultsSegue", sender: sender)
    }

    @IBAction func paperButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("resultsSegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! ResultsViewController
        vc.userChoice = uiButtonToShape(sender as! UIButton)
    }
    
    func uiButtonToShape(button: UIButton) -> Shape {
        let title = button.titleLabel?.text!
        return Shape(rawValue: title!)!
    }
    
}

