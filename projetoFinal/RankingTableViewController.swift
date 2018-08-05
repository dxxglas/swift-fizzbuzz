//
//  RankingTableViewController.swift
//  projetoFinal
//
//  Created by Lab on 02/08/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit
import CoreData

class RankingTableViewController: UITableViewController {
    
    var players: [Player] = []
    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = self.appDelegate?.persistentContainer.viewContext
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath) as? RankingTableViewCell
        
            else {
                fatalError("Tipo de célula não é RankingTableViewCell")
        }

        // Configure the cell...
        let currentPlayer = self.players[indexPath.row]
        
        cell.playerScore.text = currentPlayer.score
        cell.playerName.text = currentPlayer.name
        cell.playerImage.image = UIImage(data: currentPlayer.image!)

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        
        do {
            try self.players = (self.managedContext?.fetch(fetchRequest))!
            self.tableView.reloadData()
        } catch let error as NSError {
            print("erro na hora do request: \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let pessoa = self.players[indexPath.row]
            self.managedContext?.delete(pessoa)
            self.appDelegate?.saveContext()
            
            let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
            do {
                try self.players = (self.managedContext?.fetch(fetchRequest))!
                tableView.reloadData()
            } catch {
                print("não encontrado")
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
