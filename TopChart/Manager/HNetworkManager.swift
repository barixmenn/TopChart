//
//  HNetworkManager.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import Foundation

class HNetworkManager {
    static let shared = HNetworkManager()
    
    func fetchSongs(completion: @escaping (Result<[Song],Error>)-> Void) {
        
        guard let baseURL = URL(string: "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/10/songs.json") else {return}
        
        let task = URLSession.shared.dataTask(with: baseURL) { data, _, error in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                do {
                    let songs = try JSONDecoder().decode([Song].self, from: data)
                    completion(.success(songs))
                    print(songs)
                }catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}
