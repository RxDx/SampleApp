//
//  AlbumDetailController.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

import UIKit

class AlbumDetailController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    
    var album: Album?
    
    // MARK: - State
    override func viewDidLoad() {
        super.viewDidLoad()

        albumImageView.loadFrom(url: album?.url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Storyboard
    static func storyboardInstance(album: Album?) -> AlbumDetailController? {
        let storyboard = UIStoryboard(name: "AlbumDetail", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as? AlbumDetailController
        controller?.album = album
        return controller
    }

}
