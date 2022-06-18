//
//  ClassMoviesDetailsModel.swift
//  Movies List
//
//  Created by MacOS on 16/06/22.
//

import Foundation

struct ClassMovieDetailsModel : Codable {
    
    let adult : Bool?
    let backdropPath : String?
    let belongsToCollection : ClassLatestMoviesBelongsToCollection?
    let budget : Int?
    let genres : [ClassLatestMoviesGenre]?
    let homepage : String?
    let id : Int?
    let imdbId : String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let productionCompanies : [ClassLatestMoviesProductionCompany]?
    let productionCountries : [ClassLatestMoviesProductionCountry]?
    let releaseDate : String?
    let revenue : Int?
    let runtime : Int?
    let spokenLanguages : [ClassLatestMoviesSpokenLanguage]?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let voteAverage : Float?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        belongsToCollection = try ClassLatestMoviesBelongsToCollection(from: decoder)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        genres = try values.decodeIfPresent([ClassLatestMoviesGenre].self, forKey: .genres)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imdbId = try values.decodeIfPresent(String.self, forKey: .imdbId)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        productionCompanies = try values.decodeIfPresent([ClassLatestMoviesProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try values.decodeIfPresent([ClassLatestMoviesProductionCountry].self, forKey: .productionCountries)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        spokenLanguages = try values.decodeIfPresent([ClassLatestMoviesSpokenLanguage].self, forKey: .spokenLanguages)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try values.decodeIfPresent(Float.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
}

struct ClassLatestMoviesBelongsToCollection : Codable {
    
    let backdropPath : String?
    let id : Int?
    let name : String?
    let posterPath : String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
    }
    
}


struct ClassLatestMoviesGenre : Codable {
    let id : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}

struct ClassLatestMoviesProductionCompany : Codable {
    
    let id : Int?
    let logoPath : String?
    let name : String?
    let originCountry : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        logoPath = try values.decodeIfPresent(String.self, forKey: .logoPath)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        originCountry = try values.decodeIfPresent(String.self, forKey: .originCountry)
    }
    
}

struct ClassLatestMoviesProductionCountry : Codable {
    
    let iso31661 : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso31661 = try values.decodeIfPresent(String.self, forKey: .iso31661)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}

struct ClassLatestMoviesSpokenLanguage : Codable {
    
    let englishName : String?
    let iso6391 : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        englishName = try values.decodeIfPresent(String.self, forKey: .englishName)
        iso6391 = try values.decodeIfPresent(String.self, forKey: .iso6391)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
