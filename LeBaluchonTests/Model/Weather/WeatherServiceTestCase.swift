//
//  WeatherServiceTestCase.swift
//  LeBaluchonTests
//
//  Created by Pierre on 03/09/2021.
//

import XCTest
@testable import LeBaluchon

class WeatherServiceTestCase: XCTestCase {
    
    var service: WeatherService!
    

    private let sessionConfiguration: URLSessionConfiguration = {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolFake.self]
        return sessionConfiguration
    }()
    
    func testsFetchWeatherService_WhenFakeSessionWithErrorResponseData_ThenShouldReturnNoData() {
        URLProtocolFake.fakeURLs = [FakeResponseData.weatherUrl: (nil, nil, FakeResponseData.error)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: WeatherService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getWeather() { result in
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .noData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchWeatherService_WhenFakeSessionWithErrorInUrl_ThenShouldReturnInvalidResponse() {
        URLProtocolFake.fakeURLs = [FakeResponseData.currencyUrl: (nil, FakeResponseData.responseKO, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: WeatherService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getWeather() { result in
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .invalidResponse)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchWeatherService_WhenFakeSessionWithError_ThenShouldReturnIndecodable() {
        URLProtocolFake.fakeURLs = [FakeResponseData.weatherUrl: (FakeResponseData.incorrectData, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: WeatherService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getWeather() { result in
            guard case .failure(let error) = result else { return }
            
            XCTAssertTrue(error == .undecodableData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchWeatherService_WhenFakeSessionWithGoodRequest_ThenShouldReturnSuccess() {
        URLProtocolFake.fakeURLs = [FakeResponseData.weatherUrl: (FakeResponseData.correctDataWeather, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: WeatherService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getWeather() { result in
            guard case .success(let success) = result else { return }

            XCTAssertTrue(success.list[0].weather[0].id == 803)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

}
