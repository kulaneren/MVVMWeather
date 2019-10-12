//
//  SettingsViewModel.swift
//  MVVMWeatherApp
//
//  Created by eren on 11.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celcius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
//    let units = [Unit.celcius, Unit.fahrenheit]
    // OR If CaseIterable
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit

    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
