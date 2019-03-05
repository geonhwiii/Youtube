//
//  Video.swift
//  Youtube
//
//  Created by 정건휘 on 05/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class Video: NSObject {
   
   var thumbnailImageName: String?
   var title: String?
   var numberOfViews: Int?
   var uploadDate: Date?
   
   var channel: Channel?
   
}

class Channel: NSObject {
   var name: String?
   var profileImageName: String?
}
