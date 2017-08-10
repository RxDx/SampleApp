//
//  Album.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

import SwiftyJSON

struct Album: Jsonable {
    
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
    init(fromJson json: JSON) {
        albumId = json["albumId"].int
        id = json["id"].int
        title = json["title"].string
        url = json["thumbnailUrl"].string
        thumbnailUrl = json["thumbnailUrl"].string
    }
}
