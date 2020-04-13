//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/3/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//
// MARK: Singleton

import UIKit

class NetworkManager {
    static let shared       = NetworkManager()
    private let baseURL             = "https://api.github.com/users/"
    private let followersPerPage    = 100
    let cache               = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=\(followersPerPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
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
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
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
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
