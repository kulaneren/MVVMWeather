//
//  AddWeatherCityViewController.swift
//  MVVMWeatherApp
//
//  Created by eren on 8.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    var delegate: AddWeatherDelegate?

    @IBOutlet weak var txtCityName: UITextField!

    @IBAction func btnSaveTapped(){

        if let city = txtCityName.text{
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city),uk&appid=7d2dd8c9c5578b741c7735ad3f0d39ea&units=imperial")!

            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in

                let weatherVm = try? JSONDecoder().decode(WeatherViewModel.self, from: data)

                return weatherVm
            }

            Webservice().load(resource: weatherResource){ [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
        
    }

    @IBAction func btnCloseTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
