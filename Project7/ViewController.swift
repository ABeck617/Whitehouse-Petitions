//
//  ViewController.swift
//  Project7
//
//  Created by Anthony Beckford on 12/10/22.
//

import UIKit

class ViewController: UITableViewController {
    //creating properties
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

            if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
                petitions = jsonPetitions.results
                tableView.reloadData()
        }
    }

    // adding a tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
}

