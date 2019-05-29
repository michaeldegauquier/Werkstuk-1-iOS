//
//  PersoonTableViewController.swift
//  Werkstuk1
//
//  Created by student on 06/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

// Stackoverflow. How can I make an image full screen when clicked and then original size when clicked again? Geraadpleegd via
// https://stackoverflow.com/questions/34694377/swift-how-can-i-make-an-image-full-screen-when-clicked-and-then-original-size
// Geraadpleegd op 7 april 2019

// Arthur Knopper. Add row to table view iOS. Geraadpleegd via
// https://www.ioscreator.com/tutorials/add-rows-table-view-ios-tutorial-ios12
// Geraadpleegd op 7 april 2019

// Stackoverflow. Deleting a row from a UITableView. Geraadpleegd via
// https://stackoverflow.com/questions/40156274/deleting-a-row-from-a-uitableview-in-swift-3
// Geraadpleegd op 7 april 2019



import UIKit

var item = Persoon()
var items = [Persoon]()

class PersoonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = Persoon(naam: "De Gauquier", voornaam: "Michael", foto: "user", gpsCoordinaten: [50.740778, 4.223714], telefoonnummer: "0477838383", adres: Adres(straat: "Een straat", huisnummer: 456, postcode: 1500, gemeente: "Halle"))
        let item2 = Persoon(naam: "De Grote", voornaam: "Trevor", foto: "user", gpsCoordinaten: [50.0, 4.223714], telefoonnummer: "0477848484", adres: Adres(straat: "De straat", huisnummer: 15, postcode: 1235, gemeente: "Ergens"))
        
        items.append(item1)
        items.append(item2)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[indexPath.row].voornaam
        cell.detailTextLabel?.text = items[indexPath.row].naam
        cell.imageView?.image = UIImage(named: items[indexPath.row].foto)

        return cell
    }
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func add(segue:UIStoryboardSegue) {
        print("Person added")
        let addpersoonVC = segue.source as! AddPersoonViewController
        item = addpersoonVC.itemAdd
        
        items.append(item)
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        /*
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
 */
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "naarPersoonDetails"
        {
            let vc = segue.destination as! ViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.item = items[(indexPath?.row)!]
        }
    }
}
