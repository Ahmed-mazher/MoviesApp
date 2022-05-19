//
//  ApiClientTests.swift
//  MoviesAppTests
//
//  Created by Front Tech on 19/05/2022.
//

import XCTest
@testable import MoviesApp
import OHHTTPStubs

class ApiClientTests: XCTestCase {
    let apiService: MoviesServiceProtocol = APIServices()
    
    override func setUp() {
         super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        //given
        stub { (urlRequest) -> Bool in
            return urlRequest.url?.absoluteString.contains("/discover/movie") ?? false
        } response: { (urlRequest) -> HTTPStubsResponse in
            
            let jsonModel: [String:Any] = [
                "page": 1,
                "total_pages": 33597,
                "total_results": 671922
            ]
            
            return HTTPStubsResponse(jsonObject: jsonModel, statusCode: 200, headers: nil)
        }
        var expectedJson: MoviesListModel? = nil

        let exception = self.expectation(description: "Network Call Failed.")
        
        // when
        
        apiService.fetchMovies(urlString: EndPoints.baseURl, page: 1) {  result in
            switch result{
            case .success(let movies):
                expectedJson = movies
                exception.fulfill()
            case .failure(let error):
                print(error)
            }
        }
        
        //then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedJson)
        XCTAssertEqual(expectedJson?.total_pages, 33597)
    }

}
