//
//  ViewController.swift
//  carthage_test
//
//  Created by Sudipto Roy on 1/14/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // https://api.darksky.net/forecast/9c67136d3ccda3583fea70f0a782be0d/37.8267,-122.4233

    @IBAction func executeRequest(_ sender: Any) {
        guard let urlToExecute = URL (string: "https://api.darksky.net/forecast/9c67136d3ccda3583fea70f0a782be0d/23.8103,90.4125") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
}

