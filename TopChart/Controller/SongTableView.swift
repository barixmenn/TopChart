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
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SongData.count
        
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = SongData[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as? SongTableViewCell {
            
            cell.songNameLabel.text = song.name
            cell.artistNameLabel.text = song.artistName
            // burada her eriştiğimizde resim yeniden indiriliyor, aslında resim song struct'ının bir parçası olmalı ve ilk decode edildiğinde indirilmeli ve bir değişkende saklanmalı, ama nasıl?
            cell.songImage.image = UIImage(url: song.artworkUrl100)
       
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let songUrl = URL(string: SongData[indexPath.row].url) {
            UIApplication.shared.open(songUrl)
        }
    }
    
   
    }
    
    



