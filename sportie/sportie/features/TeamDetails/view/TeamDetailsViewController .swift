//
//  LeagueDetailsViewController.swift
//
//
//  Created by Yasmine Ghazy on 13/04/2021.
//

import UIKit

class TeamDetailsViewController : UITableViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var informedYearLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var roundView: UIView!
    //MARK: - Properties
    var item: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    
    //MARK: - Methods
    func setupViews(){
        if let item = item{
            informedYearLabel.text = "\(item.intFormedYear!)"
            nameLabel.text = item.strTeam
            descLabel.text = item.strDescriptionEN
            teamImageView.setImage(urlString: item.strTeamBadge)
            coverImageView.setImage(urlString: item.strTeamBadge)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

}
