//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation

enum AsyncStatus {
    case initial, loading, loaded, error
}

class HomeViewModel: ObservableObject {
    // Call the fetch call using DealsService
    @Published var data = [Deal]()
    @Published var status: AsyncStatus = .initial
    
    let service = DealsService()
    
    func getDeals() {
        do {
            self.data = try service.fetchDeals()
            self.status = .loaded
        } catch {
            if let error = error as? APIError {
                print(error.description)
            } else {
                print(error.localizedDescription)
            }
        }
    }
    
}
