//
//  ApiService.swift
//  Youtube
//
//  Created by 정건휘 on 05/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ApiService: NSObject {
   static let sharedInstance = ApiService()
   
   func fetchVideo(completion: @escaping ([Video]) -> Void) {
      guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else {
         fatalError("Invalid URL")
      }
      let session = URLSession(configuration: .default)
      let dataTask = session.dataTask(with: url) { (data, response, error) in
         if let error = error {
            print(error.localizedDescription)
            return
         }
         guard let data = data else { return }
         
         do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            var videos = [Video]()
            for dict in json as! [[String: Any]] {
               let video = Video()
               video.title = dict["title"] as? String
               video.thumbnailImageName = dict["thumbnail_image_name"] as? String
               let channelDictionary = dict["channel"] as! [String: AnyObject]
               let channel = Channel()
               channel.name = channelDictionary["name"] as? String
               channel.profileImageName = channelDictionary["profile_image_name"] as? String
               video.channel = channel
               
               videos.append(video)
            }
            DispatchQueue.main.async {
               completion(videos)
            }
            print(json)
         } catch {
            print(error.localizedDescription)
         }
      }
      dataTask.resume()
      
   }
   
}
