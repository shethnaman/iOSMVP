//
//  Webservice.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//

import Foundation
import Alamofire.Swift
let ApiURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

typealias ApiCompletionHandler = (_ json : String) -> Void;
typealias ApiFailuerHandler = (_ error : Error) -> Void;


func callGetApi(_ url : String, completionHandler : @escaping ApiCompletionHandler , failureHandler : @escaping ApiFailuerHandler)   {
 
    AF.request(url).responseString { response in
        if response.result.isSuccess {
            completionHandler(response.result.value!)
        }else {
            let error = response.error!
            failureHandler(error)
        }
     }
}

