//
//  Song.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import Foundation
struct Song: Decodable {
    // MARK: - Properties
    let name: String
    let artistName: String
    let artworkUrl100: String
    let url: String
}
