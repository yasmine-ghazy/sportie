//
//  LeagueDetailsPresenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 22/04/2021.
//

import Foundation

protocol LeagueDetailsPresenterProtocol {
    func getData(leagueId: String)
    func favSelected(league: League)

    func attachView(view: LeagueDetailsView)
    func detachView()
}

protocol LeagueDetailsView{
    func startLoading()
    func finishLoading()
    func showNoInternet()
    func showError(message: String)
    
    func makeFavorite(league:League)

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
    private let leagueRepo: LeagueRepoProtocol?
    
    init(eventRepo: EventRepoProtocol, teamRepo: TeamRepoProtocol, leagueRepo: LeagueRepoProtocol){
        self.eventRepo = eventRepo
        self.teamRepo = teamRepo
        self.leagueRepo = leagueRepo
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
                        self.getUpcomingEvents(leagueId: leagueId, roundNumber: "\(Int(events.first!.intRound ?? "1")! + 1)", season: events.first!.strSeason)

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

    func favSelected(league: League){
        if league.isFav{
            if let result = leagueRepo?.deleteFavourite(leagueId: league.idLeague),result{
                self.view?.makeFavorite(league: league)
            }else{
                self.view?.showError(message: "Sorry, Favourite cannot be deleted.")
            }
            
        }else{
            if let result = leagueRepo?.addFavourite(league: league),result{
                self.view?.makeFavorite(league: league)
            }else{
                self.view?.showError(message: "Sorry, Favourite cannot be added.")
            }
        }
    }
    
}
