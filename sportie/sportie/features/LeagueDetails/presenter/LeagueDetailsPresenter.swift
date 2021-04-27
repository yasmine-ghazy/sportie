//
//  LeagueDetailsPresenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 22/04/2021.
//

import Foundation

protocol LeagueDetailsPresenterProtocol {
    func getData(leagueId: String)
    func attachView(view: LeagueDetailsView)
    func detachView()
}

protocol LeagueDetailsView{
    func startLoading()
    func finishLoading()
    func showNoInternet()
    
    func setEmptyTeams()
    func setEmptyUpcomingEvents()
    func setEmptyLatestResults()
    
    func setTeams(items: [Team])
    func setUpcomintEvents(items: [Event])
    func setLatestResults(items: [Event])
}

class LeagueDetailsPresenter: LeagueDetailsPresenterProtocol{


    var view: LeagueDetailsView?
    private let eventRepo: EventRepoProtocol?
    private let teamRepo: TeamRepoProtocol?
    
    init(eventRepo: EventRepoProtocol, teamRepo: TeamRepoProtocol){
        self.eventRepo = eventRepo
        self.teamRepo = teamRepo
    }
    
    func attachView(view: LeagueDetailsView){
        self.view = view
    }
    
    func detachView(){
        self.view = nil
    }
    
    func getData(leagueId: String) {
        getTeams(leagueId: leagueId)
        getLatestResults(leagueId: leagueId)
    }
    

    
    
    func getTeams(leagueId: String){
        if(Reachability.isConnectedToNetwork()){
            self.view?.startLoading()
            teamRepo?.getTeams(leagueId: leagueId){ (response) in
                self.view?.finishLoading()
                switch(response.status!){
                case .success:
                    if let teams = response.data?.teams, !teams.isEmpty{
                        self.view?.setTeams(items: teams)
                    }else{
                        self.view?.setEmptyTeams()
                    }
                case .failure:
                        self.view?.setEmptyTeams()
                }
            }
        }else{
            self.view?.showNoInternet()
        }
    }
    
    
    func getUpcomingEvents(leagueId: String, roundNumber: String, season: String){
        if(Reachability.isConnectedToNetwork()){
            self.view?.startLoading()
            eventRepo?.getUpcomingEvents(leagueId: leagueId, roundNumber: roundNumber, season: season){ (response) in
                self.view?.finishLoading()
                switch(response.status!){
                case .success:
                    if let events = response.data?.events, !events.isEmpty{
                        self.view?.setUpcomintEvents(items: events)
                    }else{
                        self.view?.setEmptyUpcomingEvents()
                    }
                case .failure:
                        self.view?.setEmptyUpcomingEvents()
                }
            }
        }else{
            self.view?.showNoInternet()
        }
    }
    func getLatestResults(leagueId: String) {
        if(Reachability.isConnectedToNetwork()){
            self.view?.startLoading()
            eventRepo?.getLatestResults(leagueId: leagueId){ (response) in
                self.view?.finishLoading()
                switch(response.status!){
                case .success:
                    if let events = response.data?.events, !events.isEmpty{
                        self.view?.setLatestResults(items: events)
                        self.getUpcomingEvents(leagueId: leagueId, roundNumber: "\(Int(events.last!.intRound)! + 1)", season: events.last!.strSeason)
                        

                    }else{
                        self.view?.setEmptyLatestResults()
                    }
                case .failure:
                        self.view?.setEmptyLatestResults()
                }
            }
        }else{
            self.view?.showNoInternet()
        }
    }

    
}
