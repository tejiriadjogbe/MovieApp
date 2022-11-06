//
//  MoviesModel.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 06/11/2022.
//

import Foundation

// MARK: - MoviesResponse
struct MoviesResponse: Codable {
    let search: [Movies]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Movies
struct Movies: Codable {
    let title, year, imdbID, type, poster: String
    let rated, released: String?
    let runtime, genre, director, writer: String?
    let actors, plot, language, country: String?
    let awards, metascore, imdbRating, imdbVotes: String?
    let dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}
