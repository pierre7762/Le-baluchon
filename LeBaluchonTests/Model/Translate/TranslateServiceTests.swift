//
//  TranslateServiceTest.swift
//  LeBaluchonTests
//
//  Created by Pierre on 10/09/2021.
//

import XCTest
@testable import LeBaluchon

class TranslateServiceTests: XCTestCase {

    private let sessionConfiguration: URLSessionConfiguration = {
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolFake.self]
        return sessionConfiguration
    }()
    
    func testsFetchTranslate_WhenFakeSessionWithErrorIsPassed_ThenShouldReturnAnError() {
        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (nil, nil, FakeResponseData.error)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: TranslateService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "hello")
        sut.getTranslation(textToTranslate: "bonjour", languageTarget: "en") {result in
            guard case .failure(let error) = result else {
                XCTFail("Test failed: \(#function)")
                return
            }
            XCTAssertTrue(error == .invalidResponse)
            print()
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchTranslate_WhenFakeSessionWithIncorrectDataAndValidResponseArePassed_ThenShouldReturnAnError() {
        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (FakeResponseData.incorrectData, FakeResponseData.responseKO, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: TranslateService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "hello")
        sut.getTranslation(textToTranslate: "bonjour", languageTarget: "en") {result in
            guard case .failure(let error) = result else {
                XCTFail("Test failed: \(#function)")
                return
            }
            XCTAssertTrue(error == .invalidResponse)
            print()
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testsFetchTranslate_WhenFakeSessionWithIncorrectDataAndValidResponseArePassed_ThenShouldReturnAnErro() {
        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (FakeResponseData.incorrectData, FakeResponseData.responseKO, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: TranslateService = .init(session: fakeSession)
        
        let expectation = XCTestExpectation(description: "hello")
        sut.getTranslation(textToTranslate: "bonjour", languageTarget: "en") {result in
            guard case .failure(let error) = result else {
                XCTFail("Test failed: \(#function)")
                return
            }
            print("--------!!!!!!!!!!!!!!!!!--------------")
            print(error)
            print("--------!!!!!!!!!!!!!!!!!--------------")
            XCTAssertTrue(error == .invalidResponse)
            print()
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }


}
