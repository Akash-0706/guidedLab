//
//  ViewController.swift
//  login
//
//  Created by Akash on 04/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.navigationItem.title = username.text;
//    }
    
    
    @IBAction func forgotUsername(_ sender: UIButton) {
         performSegue(withIdentifier: "forgot", sender: sender)
    }
    
}

