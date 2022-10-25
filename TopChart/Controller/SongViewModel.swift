//
//  SongViewModel.swift
//  TopChart
//
//  Created by Baris on 25.10.2022.
//

import Foundation

import Foundation

class SongViewModel {
    //MARK: - Properties -
    
    var songService = HNetworkManager()
    weak var delegate: SongDelegate?
    var songList: [Song]?
    
    init(delegate: SongDelegate){
        self.delegate = delegate
    }
    
    //MARK: - Functions -
    
    func fetchMovies(searchString: String) {
        HNetworkManager().fetchSongs() { res in
            switch res {
            case .success(let songs):
                self.songList = songs

                if let songList = self.songList {
                    self.delegate?.fetchMoviesOnSuccess(movieList: songList)
                }
                
            case .failure(let error):
                self.delegate?.fetchMoviesOnError(error: error)
            }
        }
    }
}
