//
//  citiesTVC.swift
//  Weather
//
//  Created by Sam Greenhill on 7/1/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class citiesTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.backgroundColor = UIColor(colorLiteralRed: 169/255, green: 148/255, blue: 196/255, alpha: 1.0)
        
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
        return cities.count
    }
    
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! citiesTVCell

        // Configure the cell...
        
        
        DispatchQueue.main.async {
            cell.cityLbl.text = cities[indexPath.row]
            cell.cityLbl.textColor = UIColor.white
            cell.activityInd.startAnimating()
            getWeather(date: nil, city: cities[indexPath.row]) { (weatherObj) in
                if let temp = weatherObj.temperature {
                    cell.activityInd.stopAnimating()
                    cell.tempLbl.textColor = UIColor.white
                    cell.tempLbl.text = temp + "° C"
                }
            }
            
            cell.backgroundColor = UIColor(colorLiteralRed: 169/255, green: 148/255, blue: 196/255, alpha: 1.0)
        }
        

        return cell
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
