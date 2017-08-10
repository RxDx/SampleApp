//
//  AlbumListController.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

import UIKit

class AlbumListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AlbumListViewModel?
    
    // MARK: - State
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)
    
        viewModel = AlbumListViewModel(delegate: self)
        viewModel?.getPhotos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ViewModel
    override func updateUI() {
        tableView.reloadData()
    }
    
    // MARK: - RefreshControl
    func refreshControlValueChanged() {
        tableView.refreshControl?.endRefreshing()
        viewModel?.getPhotos()
    }
    
    // MARK: - Storyboard
    static func storyboardInstance() -> UINavigationController? {
        let storyboard = UIStoryboard(name: "AlbumList", bundle: nil)
        return storyboard.instantiateInitialViewController() as? UINavigationController
    }
}

// MARK: - UITableView
extension AlbumListController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumCell,
              let album = viewModel?.albumFor(section: indexPath.section, row: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.album = album
        
        
        return cell
    }
}

extension AlbumListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let album = viewModel?.albumFor(section: indexPath.section, row: indexPath.row),
           let controller = AlbumDetailController.storyboardInstance(album: album) {
    
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
