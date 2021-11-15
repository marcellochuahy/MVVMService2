//
//  Service.swift
//  MVVMService
//
//  Created by Marcello Chuahy on 14/11/21.
//

import Foundation

enum UserError {
    case error
    case url
    case dataTask(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
}

class Service {

    func fetchData(
        onComplete: @escaping ([UserModel]) -> Void,
        onError:    @escaping (UserError) -> Void
    ) {
        
        let urlAsString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlAsString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data: Data?, urlResponse: URLResponse?, error: Error?) in
            
            
            // ⚠️ TODO
            // Implementar UserError
            
            guard error == nil else {
                //onError(.error);
                print("local error");
                return
            }
            
            guard let httpURLResponse = urlResponse as? HTTPURLResponse else { return print("HTTPURLResponse error")}
            guard httpURLResponse.statusCode == 200 else { return print("Algum status code diferente de 200") }
            guard let data = data else { return print("Data error") }
  
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                onComplete(users)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }

}
