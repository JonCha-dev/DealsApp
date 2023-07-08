//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    // Call the fetch call using DealsService
    @Published var data = [Deal]()
    
    let service = DealsService()
    
    func getDeals() {
        do {
            self.data = try service.fetchDeals()
        } catch {
            if let error = error as? APIError {
                print(error.description)
            } else {
                print(error.localizedDescription)
            }
        }
    }
    
}
