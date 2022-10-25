//
//  SongTableView.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import UIKit

class SongTableView: UITableViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HNetworkManager.shared.fetchSongs { result in
            
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        //let currentSong = SongData[indexPath.row]
        cell.songNameLabel.text = "deneme"
        cell.artistNameLabel.text = "denemeeee"
        //cell.songImage.setImage(from: currentSong.artworkUrl100)

        // Configure the cell...

        return cell
    }
    

}
