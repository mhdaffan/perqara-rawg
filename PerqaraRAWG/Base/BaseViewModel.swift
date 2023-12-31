//
//  BaseViewModel.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

class BaseViewModel {
    
    var onError: ((Error) -> Void)?
    var refreshData: (() -> Void)?
    var pullToRefresh: ((Bool) -> Void)?
    var paginationRefresh: ((Bool) -> Void)?
    
}
