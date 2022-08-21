//
//  AlertHelper.swift
//  SummerChat-Swift
//
//  Created by hakkı can şengönül on 21.08.2022.
//

import Foundation
import UIKit
class AlertHelper {
    static func alert(withMessage message: String) -> UIAlertController{
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertButton)
        return alert
       
    }
}
