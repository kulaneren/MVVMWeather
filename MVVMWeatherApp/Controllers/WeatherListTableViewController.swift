//
//  WeatherListTableViewController.swift
//  MVVMWeatherApp
//
//  Created by eren on 8.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {

    private var weatherListViewModel = WeatherListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    //MARK: AddWeatherDelegate Methods

    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }

    //MARK: Segue Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NAvigation conrontroller not found")
        }

        if segue.identifier == "AddWeatherCityViewController" {
            guard let vcAddWeatherCity = nav.viewControllers.first as? AddWeatherCityViewController else {
                fatalError("AddWeatherCityViewController not found")
            }
            vcAddWeatherCity.delegate = self

        }else if segue.identifier == "SettingsTableViewController" {

            guard let vcSettings = nav.viewControllers.first as? SettingsTableViewController else {
                fatalError("SettingsTableViewController not found")
            }
            vcSettings.delegate = self
        }
    }


    //MARK: TableView Delegate methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell

        cell.configureCell(self.weatherListViewModel.modelAt(indexPath.row))

        return cell
    }
}

extension WeatherListTableViewController: SettingsDelegate {

    //MARK: SettingsDelegate Methods
    func didSettingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
