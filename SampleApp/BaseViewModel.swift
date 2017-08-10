//
//  BaseViewModel.swift
//  SampleApp
//
//  Created by Rodrigo Dumont on 10/08/17.
//  Copyright © 2017 RxDx. All rights reserved.
//

class BaseViewModel {
    
    var delegate: BaseViewModelProtocol?
    
    init(delegate: BaseViewModelProtocol) {
        self.delegate = delegate
    }
    
}

protocol BaseViewModelProtocol {
    func updateUI()
    func showAlert(_ message: String)
    func showLoading()
    func hideLoading()
}
