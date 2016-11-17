//
//  ViewController.swift
//  SwiftJson
//
//  Created by Sobhan Eskandari on 11/16/16.
//  Copyright © 2016 Sobhan Eskandari. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let url: String = "http://www.kelidestan.com/fixed-url/kelidestan-json-1.html"
    var dictOfKeyValues:[String:[String]] = [:];
    
    @IBOutlet weak var textView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let parser:JsonParse = JsonParse(url: url)
        parser.parse(JsonArrayNode: "kelidestan")
        
        _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            for city in JsonParse.jsonValuesDict["city"]!{
                self.textView.text? += city + "\n"
            }
        }
    }
    
    // must be internal or public.
    func update() {
        // Something cool
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

