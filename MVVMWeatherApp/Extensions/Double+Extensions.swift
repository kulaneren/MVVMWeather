//
//  Double+Extensions.swift
//  MVVMWeatherApp
//
//  Created by eren on 10.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import Foundation

extension Double {

    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
