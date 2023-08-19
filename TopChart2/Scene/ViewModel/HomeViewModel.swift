//
//  HomeViewModel.swift
//  TopChart2
//
//  Created by MacBookAir on 19.08.2023.
//

import Foundation

protocol IHomeViewModel: AnyObject {
    func didErrorList(error:String)
    func didSuccess()
}

final class HomeViewModel {
    var delegate : IHomeViewModel?
    private let manager = NetworkManager.shared
    
    var song: AlbumResponse?
}

extension HomeViewModel {
    
    func getTurkeySong() {
        manager.getTurkeyMusic { result in
            switch result {
            case .success(let success):
                self.song = success
                self.delegate?.didSuccess()
            case .failure(let failure):
                print(failure.localizedDescription)
                self.delegate?.didErrorList(error: failure.localizedDescription)
            }
        }
    }
    
    func getGlobalSong() {
        manager.getGlobalMusic { result in
            switch result {
            case .success(let success):
                self.song = success
                self.delegate?.didSuccess()
            case .failure(let failure):
                print(failure.localizedDescription)
                self.delegate?.didErrorList(error: failure.localizedDescription)
            }
        }
    }
}
