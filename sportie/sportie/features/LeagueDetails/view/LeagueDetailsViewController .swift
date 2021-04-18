//
//  LeagueDetailsViewController.swift
//
//
//  Created by Yasmine Ghazy on 13/04/2021.
//

import UIKit

class LeagueDetailsViewController : UITableViewController {
    
    //MARK: - IBOutlet

    //MARK: - Properties
    var item: Movie?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    //MARK: - Methods
    func setupViews(){
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

}
