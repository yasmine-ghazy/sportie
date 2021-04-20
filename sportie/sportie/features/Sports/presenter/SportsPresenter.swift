//
//  Presenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 19/04/2021.
//

import Foundation

protocol SportsPresenterProtocol {
    func getSports()
    func attachView(view: SportsView)
    func detachView()
}

protocol SportsView{
    func startLoading()
    func finishLoading()
    func showNoInternet()
    func setEmptySports()
    func setSports(items: [Sport])
}

class SportsPresenter: SportsPresenterProtocol{
    
    var view: SportsView?
    private let repo: SportRepoProtocol?
    
    init(repo: SportRepoProtocol){
        self.repo = repo
    }
    
    func attachView(view: SportsView){
        self.view = view
    }
    
    func detachView(){
        self.view = nil
    }
    
    func getSports(){
        if(Reachability.isConnectedToNetwork()){
            self.view?.startLoading()
            repo?.getSports{ (response) in
                self.view?.finishLoading()
                switch(response.status!){
                case .success:
                    if let sports = response.data?.sports, !sports.isEmpty{
                        self.view?.setSports(items: sports)
                    }else{
                        self.view?.setEmptySports()
                    }
                case .failure:
                        self.view?.setEmptySports()
                }
            }
        }else{
            self.view?.showNoInternet()
        }
    }
}
