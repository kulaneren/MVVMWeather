//
//  WeatherCell.swift
//  MVVMWeatherApp
//
//  Created by eren on 8.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblDegree: UILabel!

    func configureCell(_ vm: WeatherViewModel) {
        self.lblCityName.text = vm.name
        self.lblDegree.text = vm.currentTemperature.temperature.formatAsDegree
    }

    func factorial(n: Int) -> Int {
        while n - 1 > 1 {
            return n * factorial(n: n-1)
        }
        return n

    }
}
