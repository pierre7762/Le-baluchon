//
//  URLEncodableTest.swift
//  LeBaluchonTests
//
//  Created by Pierre on 23/09/2021.
//

import XCTest
@testable import LeBaluchon

class URLEncodableTest: XCTestCase {
    let urlService = UrlServiceFake()

    func testGivenBaseUrlIsAlone_WhenUseUrlEncodable_ThenReturnBaseUrlAlone() {
        let responseExpected = "https://www.test.fr/baseUrl"
        let response = urlService.buildUrlRequest(param: [])
        
        XCTAssertEqual(responseExpected, response)
    }
    
    func testGivenBaseUrlAndParamAreGiven_WhenUseUrlEncodable_ThenReturnBaseUrlWithParams() {
        let responseExpected = "https://www.test.fr/baseUrl?param1=azerty&param2=querty"
        let response = urlService.buildUrlRequest(param: [("param1", "azerty"), ("param2", "querty")])
        
        XCTAssertEqual(responseExpected, response)
    }

}
