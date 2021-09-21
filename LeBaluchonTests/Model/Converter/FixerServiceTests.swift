//
//  BinaryFixerServiceTests.swift
//  LeBaluchonTests
//
//  Created by Pierre on 10/09/2021.
//

import XCTest
@testable import LeBaluchon

class FixerServiceTests: XCTestCase {

    private let sessionConfiguration: URLSessionConfiguration = {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolFake.self]
        return sessionConfiguration
    }()
    
    func testsFetchConvertion_WhenFakeSessionWithErrorIsPassed_ThenShouldReturnAnErrorNoData() {
        URLProtocolFake.fakeURLs = [FakeResponseData.currencyUrl: (nil, nil, FakeResponseData.error)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: FixerService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getExchangeRate() { result in
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .noData)
            XCTAssertTrue(error.description == "The answer does not contain any data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchConvertion_WhenFakeSessionWithIncorrectData_ThenShouldReturnAnErrorUndecodableData() {
        URLProtocolFake.fakeURLs = [FakeResponseData.currencyUrl: (FakeResponseData.incorrectData, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: FixerService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getExchangeRate() { result in
            guard case .failure(let error) = result else { return }
            print(error)
            XCTAssertTrue(error == .undecodableData)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchConvertion_WhenFakeSessionWithBadResponse_ThenShouldReturnAnErrorInvalidResponse() {
        URLProtocolFake.fakeURLs = [FakeResponseData.currencyUrl: (nil, FakeResponseData.responseKO, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: FixerService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getExchangeRate() { result in
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .invalidResponse)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchConvertion_WhenFakeSessionWithCorrectData_ThenShouldReturnSuccess() {
        URLProtocolFake.fakeURLs = [FakeResponseData.currencyUrl: (FakeResponseData.correctDataConverter, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: FixerService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "Waiting...")
        sut.getExchangeRate() { result in
            guard case .success(let success) = result else { return }
            XCTAssertTrue(success.rates["USD"] == 1.183992)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    

}
