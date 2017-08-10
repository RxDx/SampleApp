//
//  PhotosRepository.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

class PhotosRepository: BaseRepository<Album> {
    
    init() {
        super.init(url: "photos")
    }
}
