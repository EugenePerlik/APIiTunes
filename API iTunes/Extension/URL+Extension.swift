//
//  URL+Extension.swift
//  API iTunes
//
//  Created by  Apple24 on 17/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        // формируем новый ключ : значение
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        return components?.url
    }
}
