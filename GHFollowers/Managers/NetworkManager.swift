//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/3/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//
// MARK: Singleton

import Foundation

class NetworkManager {
    static let shared   = NetworkManager()
    let baseURL         = "https://api.github.com/"
    let followersPerPage  = 100
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "users/\(username)/followers?per_page=\(followersPerPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            // check if response is nil.  If it's not nil, cast it as a Response & return the status code
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(nil, "Invalid response from the server.  Please try again.")
//                return
//            }
            
            guard let response = response as? HTTPURLResponse else {
                completed(.failure(.invalidResponse))
                return
            }

            switch response.statusCode {
            case 200:
                break
            case 400:
                completed(.failure(.statusCode400))
            case 404:
                completed(.failure(.statusCode404))
            case 500:
                completed(.failure(.statusCode500))
            default:
                completed(.failure(.unknownError))
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // Try and decode a list of Followers from the data
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
