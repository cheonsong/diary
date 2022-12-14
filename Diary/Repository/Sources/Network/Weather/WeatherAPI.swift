//
//  WeatherAPI.swift
//  Repository
//
//  Created by cheonsong on 2022/09/16.
//

import Foundation
import SwiftyJSON

struct WeatherAPI: Networkable {
    typealias Target = WeatherTargetType
    
    static func requestCurrentWeather(request: WeatherRequestDTO, completion: @escaping (Result<String, Error>) -> Void) {
        
        makeProvider().request(.requestCurrentWeather(request)) { (result) in
            switch ResponseData<JSON>.processJSONResponse(result) {
            case .success(let model):
                completion(.success(model["weather"].arrayValue.first?["main"].stringValue ?? ""))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
