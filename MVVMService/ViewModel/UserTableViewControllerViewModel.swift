//
//  UserTableViewControllerViewModel.swift
//  MVVMService
//
//  Created by Marcello Chuahy on 14/11/21.
//

import Foundation

struct UserTableViewCellViewModel {
    let name: String
}

struct UserTableViewControllerViewModel {
    
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
    let service: Service
    
    init(service: Service = Service()) {
        self.service = service
        fetchData()
    }

    func fetchData() {
        service.fetchData {(users) in
            self.users.value = users.compactMap({
                UserTableViewCellViewModel(name: $0.name)
            })
        } onError: {(userError) in
            print(userError) // ⚠️ TODO
        }
    }
    
}
