//
//  GetYoutubeData.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 19.10.2023.
//

import Foundation

class getData {
    func get_request() {
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    error == nil,
                    let data = data,
                    let string = String(data: data, encoding: .utf8)
                

                print(string)
            }
            task.resume()
        
    }
}

