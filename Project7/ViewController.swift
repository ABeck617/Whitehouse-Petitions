//
//  ViewController.swift
//  Project7
//
//  Created by Anthony Beckford on 12/10/22.
//

import UIKit

class ViewController: UITableViewController {
    //creating properties
    var petitions = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // adding a tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
}

