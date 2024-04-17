//
//  SecondViewController.swift
//  lifeCycle
//
//  Created by Akash on 05/03/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var eventNumber = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Screen-2 viewDidLoad()")
        myLabel.text = String.init();
        addEvent(from: "viewDidLoad")
    }
    
    func addEvent(from: String) {
        if let existingText = myLabel.text {
            myLabel.text = "\(existingText)\nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("Screen-2 viewWillAppear")
        addEvent(from: "willAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("Screen-2 viewDiAppear")
        addEvent(from: "didAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Screen-2 viewWillDisappear")
        addEvent(from: "willDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Screen-2 viewDidDisapper")
        addEvent(from: "viewDidDisappear")
    }

}
