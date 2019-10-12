//
//  Webservice.swift
//  MVVMWeatherApp
//
//  Created by eren on 9.10.2019.
//  Copyright © 2019 Eren Kulan. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {

    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url){ data, response, error in

            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }else{
                DispatchQueue.main.async {
                    completion(nil)
                }
            }

        }.resume()
    }
}
