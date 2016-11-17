//
//  JsonParse.swift
//  SwiftJson
//
//  Created by Sobhan Eskandari on 11/17/16.
//  Copyright © 2016 Sobhan Eskandari. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum ParserStatus{
    case Succeeded
    case Failed
}

class JsonParse {
    
    // Url To Parse
    var url:String
    static var status:ParserStatus = ParserStatus.Failed
    static var jsonValuesDict:[String:[String]] = [:]
    
    init(url:String) {
        self.url = url
        JsonParse.jsonValuesDict = [:]
    }
    
    func parse(JsonArrayNode arrayNode:String){
        
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let item = json[arrayNode].arrayValue
                let keys = item[0]
                
                for key in keys{
                    var arrayOfValues = [String]()
                    for item in json[arrayNode].arrayValue {
                        arrayOfValues.append(item[key.0].stringValue)
                    }
                    JsonParse.jsonValuesDict[key.0] = arrayOfValues
                }
                JsonParse.status = ParserStatus.Succeeded
            case .failure(let error):
                print(error)
                JsonParse.status = ParserStatus.Failed
            }
        }
    }
    
}
