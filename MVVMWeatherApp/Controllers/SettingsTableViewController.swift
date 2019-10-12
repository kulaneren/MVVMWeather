//
//  SettingsTableViewController.swift
//  MVVMWeatherApp
//
//  Created by eren on 11.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func didSettingsDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var vmSettings = SettingsViewModel()

    var delegate: SettingsDelegate?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vmSettings.units.count
    }

    //MARK: Tableview delegates methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let settingsItem = self.vmSettings.units[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)

        cell.textLabel?.text = settingsItem.displayName

        if settingsItem == self.vmSettings.selectedUnit {
            cell.accessoryType = .checkmark
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //uncheck all cells
        tableView.visibleCells.forEach() { cell in
            cell.accessoryType = .none
        }

        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.vmSettings.selectedUnit = unit
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }

    
    @IBAction func btnDoneTapped(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.didSettingsDone(vm: vmSettings)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
