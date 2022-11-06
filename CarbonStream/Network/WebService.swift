//
//  WebService.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 29/10/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case badUrl
    case decodingError
}

extension URL {
    static func forTitleSearch(_ title: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.omdbapi.com"
        components.path = "/?t=\(title)&apikey=be652ee5"
        return components.url
    }
    
    static func forAllMovies(page: Int = 1) -> URL {
        URL(string: "https://www.omdbapi.com/?s=batman&apikey=be652ee5&page=\(page)")!
    }
    
    static var forMainMovies: URL {
        URL(string: "https://www.omdbapi.com/?t=batman&apikey=be652ee5")!
    }
}

extension Movies {
    
    static func byTitle(_ title: String) -> Resource<Movies> {
        guard let url = URL.forTitleSearch(title) else {
            fatalError("id = \(title) was not found.")
        }
        return Resource(url: url)
    }
    
    static func all(page: Int = 1) -> Resource<MoviesResponse> {
        return Resource(url: URL.forAllMovies(page: page))
    }
    
    static var main: Resource<Movies> {
        return Resource(url: URL.forMainMovies)
    }
}

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
        }
    }
}

struct Resource<T: Codable> {
    
    let url: URL
    var method: HttpMethod = .get([])
}

class Webservice {
    
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        
        var request = URLRequest(url: resource.url)
        
        switch resource.method {
            case .post(let data):
                request.httpMethod = resource.method.name
                request.httpBody = data
            case .get(let queryItems):
                var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
                components?.queryItems = queryItems
            guard (components?.url) != nil else {
                throw NetworkError.badUrl
            }
                request = URLRequest(url: resource.url)
        }
        
        // create the URLSession configuration
        let configuration = URLSessionConfiguration.default
        // add default headers
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidResponse
        }
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
               print(JSONString)
            }
            throw NetworkError.decodingError
        }
        
        return result
        
    }
    
}
