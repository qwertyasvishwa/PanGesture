//
//  ViewController.swift
//  panGestureRecognizer
//
//  Created by Vishwa Raj on 01/12/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testBtn: UIButton!
    var myBeginPosition = Float32()
    var mycurrentPosition = Float32()
    var totalTravelled = Float32()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panedView(sender:)))
        self.view.addGestureRecognizer(panRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func panedView(sender:UIPanGestureRecognizer){
        
        if sender.state == UIGestureRecognizerState.began
        {
            myBeginPosition = Float32(sender.location(in: self.view).y)
            print(myBeginPosition)
            print("Started")
        }
        else if sender.state == UIGestureRecognizerState.ended
        {
            print("Ended")
        }
        
        else if sender.state == UIGestureRecognizerState.changed
        {
            mycurrentPosition = Float32(sender.location(in: self.view).y)
            totalTravelled = abs(myBeginPosition) - abs(mycurrentPosition)
            print(totalTravelled)
            
            if (totalTravelled < 100)
            {
                testBtn.alpha = 1
            }
            else if totalTravelled > 100 && totalTravelled < 200
            {
                testBtn.alpha = 0.8
            }
            else if totalTravelled > 200 && totalTravelled < 300
            {
                testBtn.alpha = 0.6
            }

            else if totalTravelled > 300 && totalTravelled < 400
            {
                testBtn.alpha = 0.4
            }
            
            else
            {
                testBtn.alpha = 0
            }
            
            
        }
    }

}
