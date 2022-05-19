//
//  ViewController.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import Foundation
struct MovieDetailModel : Codable {
	let adult : Bool?
	let backdrop_path : String?
	let belongs_to_collection : Belongs_to_collection?
	let budget : Int?
	let genres : [Genres]?
	let homepage : String?
	let id : Int?
	let imdb_id : String?
	let original_language : String?
	let original_title : String?
	let overview : String?
	let popularity : Double?
	let poster_path : String?
	let production_companies : [Production_companies]?
	let production_countries : [Production_countries]?
	let release_date : String?
	let revenue : Int?
	let runtime : Int?
	let spoken_languages : [Spoken_languages]?
	let status : String?
	let tagline : String?
	let title : String?
	let video : Bool?
	let vote_average : Double?
	let vote_count : Int?

    init(
        adult: Bool? = nil,
        backdropPath: String? = nil,
        belongsToCollection: Belongs_to_collection? = nil,
        budget: Int? = nil,
        genres: [Genres]? = nil,
        homepage: String? = nil,
        id: Int? = nil,
        imdbID: String? = nil,
        originalLanguage: String? = nil,
        originalTitle: String? = nil,
        overview: String? = nil,
        popularity: Double? = nil,
        posterPath: String? = nil,
        production_companies: [Production_companies]? = nil,
        production_countries: [Production_countries]? = nil,
        release_date: String? = nil,
        revenue: Int? = nil,
        runtime: Int? = nil,
        spoken_languages: [Spoken_languages]? = nil,
        status: String? = nil,
        tagline: String? = nil,
        title: String? = nil,
        video: Bool? = nil,
        vote_average: Double? = nil,
        vote_count: Int? = nil
    ){
        self.adult = adult
        self.backdrop_path = backdropPath
        self.belongs_to_collection = belongsToCollection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdb_id = imdbID
        self.original_language = originalLanguage
        self.original_title = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.poster_path = posterPath
        self.production_companies = production_companies
        self.production_countries = production_countries
        self.release_date = release_date
        self.revenue = revenue
        self.runtime = runtime
        self.spoken_languages = spoken_languages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
        
    }
    
	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdrop_path = "backdrop_path"
		case belongs_to_collection = "belongs_to_collection"
		case budget = "budget"
		case genres = "genres"
		case homepage = "homepage"
		case id = "id"
		case imdb_id = "imdb_id"
		case original_language = "original_language"
		case original_title = "original_title"
		case overview = "overview"
		case popularity = "popularity"
		case poster_path = "poster_path"
		case production_companies = "production_companies"
		case production_countries = "production_countries"
		case release_date = "release_date"
		case revenue = "revenue"
		case runtime = "runtime"
		case spoken_languages = "spoken_languages"
		case status = "status"
		case tagline = "tagline"
		case title = "title"
		case video = "video"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
		backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
		belongs_to_collection = try values.decodeIfPresent(Belongs_to_collection.self, forKey: .belongs_to_collection)
		budget = try values.decodeIfPresent(Int.self, forKey: .budget)
		genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
		homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		imdb_id = try values.decodeIfPresent(String.self, forKey: .imdb_id)
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
		original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
		production_companies = try values.decodeIfPresent([Production_companies].self, forKey: .production_companies)
		production_countries = try values.decodeIfPresent([Production_countries].self, forKey: .production_countries)
		release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
		revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
		runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
		spoken_languages = try values.decodeIfPresent([Spoken_languages].self, forKey: .spoken_languages)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
		vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
	}

}
