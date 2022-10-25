//
//  SongData.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import Foundation

import UIKit

// MARK: - Constants
fileprivate let feedData: Feed = load("https://rss.applemarketingtools.com/api/v2/tr/music/most-played/50/songs.json")

// MARK: - Global Constants
let SongData: [Song] = feedData.feed.results

// MARK: - Structures
fileprivate struct Feed: Decodable {
    
    // MARK: - Properties
    let feed: FeedResults
    
    // MARK: - Internal Structures
    struct FeedResults: Decodable {
        let title: String
        let results: [Song]
    }
}

// MARK: - Functions
fileprivate func load<T: Decodable>(_ urlString: String) -> T {
    let data = getData(from: urlString)
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse data as \(T.self):\n\(error)")
    }
}

fileprivate func getData(from urlString: String) -> Data {
    let data: Data

    guard let url = URL(string: urlString) else {
        fatalError("Couldn't load URL from provided string.")
    }
    
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't load data from URL:\n\(error)")
    }
    
    return data
}

// MARK: - Extensions
extension UIImage {
    convenience init?(url: String) {
        self.init(data: getData(from: url))
    }
}

extension UIImageView {
    // uiimageview async downloader, here just for reference
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: url) else {
                fatalError("Couldn't load URL from provided string.")
            }
            
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            } catch {
                fatalError("Couldn't load data from URL:\n\(error)")
            }
        }
    }
}
