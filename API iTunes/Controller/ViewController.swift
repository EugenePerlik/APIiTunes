//
//  ViewController.swift
//  API iTunes
//
//  Created by  Apple24 on 16/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    @IBOutlet weak var trackIdLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var responseInfo: Response? {
        didSet {
            updateUI()
        }
    }
    
    let url = URL(string: "https://itunes.apple.com/search")!
                         //https://itunes.apple.com/search?term=Podlodka&limit=1&country=ru
    var query = [
        "limit": "1",
        "country": "ru",
        "term": "Podlodka",
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    func requestData() {
    
        ImageController.shared.fetchPhotoInfo(url: url.withQueries(query)) { responseInfo in
            guard let podkastInfo = responseInfo else { return }
            self.responseInfo = podkastInfo
                     
            ImageController.shared.fetchImage(url: podkastInfo.results[0].artworkUrl600, completion: { image in
                guard let image = image else { return }
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
        }
    }

    func updateUI(){
        guard let result = responseInfo?.results else { return }
        // в основной поток
        DispatchQueue.main.async {
            self.trackNameLabel.text = result[0].trackName
            self.primaryGenreNameLabel.text = result[0].primaryGenreName
            self.trackIdLabel.text = " trackId - \(result[0].trackId)"
    //      self.dataLabel.text = "\(result[0].releaseDate)"

        }
    }
}

