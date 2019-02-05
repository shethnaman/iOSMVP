//
//  Connectivity.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//


import Foundation
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
