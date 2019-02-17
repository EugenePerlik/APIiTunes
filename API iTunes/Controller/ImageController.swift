//
//  PictureController.swift
//  API iTunes
//
//  Created by  Apple24 on 17/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//
import UIKit

class ImageController {
    
    static let shared = ImageController()
    
    private init() {}
    
    func fetchPhotoInfo(url: URL?, completion: @escaping (Response?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            guard let podkastInfo = try? jsonDecoder.decode(Response.self, from: data) else {
                completion(nil)
                return
            }
            completion(podkastInfo)
            }.resume()
    }
    
    func fetchImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
            }.resume()
    }
}
