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
    private let timeConvertion = TimeConversion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // https://api.darksky.net/forecast/9c67136d3ccda3583fea70f0a782be0d/37.8267,-122.4233

    @IBAction func executeRequest(_ sender: Any) {
        guard let urlToExecute = URL (string: "https://api.darksky.net/forecast/9c67136d3ccda3583fea70f0a782be0d/37.8267,-122.4233") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                //self.textView.text = json.description
                //let dictData = convertStringToDictionary(text: json.description)
                print("Currently = \(json[0]["currently"] as Any)")
                
                // Assign currently data to dataDict wich is a dictionary from json array
                let dataDict = json[0]["currently"] as? [String : Any]
                
                // Show summary dict in log
                print("Summary")
                print(dataDict!["summary"] as Any)
                
                // Show time
                let time = dataDict!["time"] as? Double
                let getTime = self.timeConvertion.getDateFromTimeStamp(timeStamp: time!)
                print("Time = \(getTime)")
                self.textView.text = getTime
                
                
                // Show summary from currently from Weather api
                self.textView.text = dataDict!["summary"] as? String
            
            }
        }
    }
}
