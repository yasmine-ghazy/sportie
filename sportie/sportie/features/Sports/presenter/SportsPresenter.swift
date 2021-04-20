//
//  Presenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 19/04/2021.
//

import Foundation

protocol SportsView{
    func getSportsSuccess(items: [Sport])
    func getSportsFailed(message: String)
    func noInternet()
}

class SportsPresenter{
    
    var view: SportsView?
    private let repo: SportRepoProtocol?
    
    init(repo: SportRepoProtocol){
        self.repo = repo
    }
    
    func attachView(view: SportsView){
        self.view = view
    }
    
    func dettachView(){
        self.view = nil
    }
    
    func getSports(){
        if(Reachability.isConnectedToNetwork()){
            repo?.getSports{ (response) in
                switch(response.status!){
                case .success:
                    if let sports = response.data?.sports{
                        self.view?.getSportsSuccess(items: sports)
                    }
                case .failure:
                    if let message = response.message{
                        self.view?.getSportsFailed(message: message)
                    }
                }
            }
            
        }else{
            self.view?.noInternet()
        }
    }
}
