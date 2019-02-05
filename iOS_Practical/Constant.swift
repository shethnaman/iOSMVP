//
//  Constant.swift
//  iOS_Practical_Naman
//
//  Created by naman on 05/02/19.
//  Copyright © 2019 naman. All rights reserved.
//

import Foundation
import UIKit

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case phone
    case pad
}

let userDevice = UIDevice.current.userInterfaceIdiom

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct constantText {
    static let noTitle = "No Title Found"
    static let noDescription = "No Description Found"
    static let noInternet = "No internet connection"
    
}
