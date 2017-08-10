//
//  AlbumListViewModel.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

class AlbumListViewModel: BaseViewModel {
    
    var albumsHash = [Int: [Album]]()
    var error: String? = nil

    // MARK: - Repository
    func getPhotos() {
        delegate?.showLoading()
        PhotosRepository().all { (response) in
            self.delegate?.hideLoading()
            if response.result.isSuccess {
                self.albumsHash = self.sortAlbums(response.result.value)
            } else {
                self.error = response.error?.localizedDescription ?? "Failed to get album"
            }
            
            self.delegate?.updateUI()
        }
    }
    
    // MARK: - Methods
    func sortAlbums(_ albums: [Album]?) -> [Int: [Album]] {
        guard let albums = albums else {
            return [Int: [Album]]()
        }
        
        albums.forEach { (album) in
            if albumsHash[album.albumId] == nil {
                albumsHash[album.albumId] = [Album]()
            }
            
            albumsHash[album.albumId]?.append(album)
        }
        
        return albumsHash
    }
    
    func numberOfSections() -> Int? {
        return albumsHash.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int? {
        let keys = Array(albumsHash.keys).sorted()
        let albumId = keys[section]
        return albumsHash[albumId]?.count
    }
    
    func albumFor(section: Int, row: Int) -> Album? {
        let keys = Array(albumsHash.keys).sorted()
        return albumsHash[keys[section]]?[row]
    }
}
