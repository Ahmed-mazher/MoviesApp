//
//  ViewController.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import Foundation


struct MoviesListModel : Codable {
	let page : Int?
	let results : [Results]?
	let total_pages : Int?
	let total_results : Int?
    
    init(page : Int? = nil, //👈
         results : [Results]? = nil,
         total_pages : Int? = nil,
         total_results : Int? = nil) {
            
            self.page = page
            self.results = results
            self.total_pages = total_pages
            self.total_results = total_results
        }
    

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case results = "results"
		case total_pages = "total_pages"
		case total_results = "total_results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
		total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
		total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
	}

}
