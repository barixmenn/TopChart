//
//  Song.swift
//  TopChart2
//
//  Created by MacBookAir on 19.08.2023.
//

import Foundation

struct Song: Decodable {
    // MARK: - Properties
    let name: String
    let artistName: String
    let artworkUrl100: String
    let url: String
}
