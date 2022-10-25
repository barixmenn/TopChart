//
//  SongDelegate.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import Foundation
protocol SongDelegate: AnyObject {
    func fetchMoviesOnSuccess(movieList: [Song])
    func fetchMoviesOnError(error: Error)
}
