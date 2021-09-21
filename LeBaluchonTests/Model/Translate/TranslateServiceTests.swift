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
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .invalidResponse)
            XCTAssertTrue(error.description == "The answer is invalide")
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
//    func testsFetchTranslate_WhenFakeSessionWith_ThenShouldReturnNoData() {
//        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (nil, nil, FakeResponseData.error)]
//        let fakeSession = URLSession(configuration: sessionConfiguration)
//        let sut: TranslateService = .init(session: fakeSession)
//
//        let expectation = XCTestExpectation(description: "hello")
//        sut.getTranslation(textToTranslate: "bonjour", languageTarget: "en") {result in
//            guard case .failure(let error) = result else { return }
//            XCTAssertTrue(error == .noData)
//            print()
//            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//            print(error)
//            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//            print()
//           expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 0.01)
//    }
    
    func testsFetchTranslate_WhenGoodRequestSend_ThenShouldBeReturnSuccess() {
        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (FakeResponseData.correctDataTranslate, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: TranslateService = .init(session: fakeSession)

        let expectation = XCTestExpectation(description: "hello")
        sut.getTranslation(textToTranslate: "Bonjour", languageTarget: "en") {result in
            guard case .success(let success) = result else { return }
            XCTAssertEqual(success.data.translations[0].translatedText, "Hello")
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testsFetchTranslate_WhenWeRecevedBadResponse_ThenShouldBeReturnUndecodable() {
        URLProtocolFake.fakeURLs = [FakeResponseData.translateUrl: (FakeResponseData.incorrectData, FakeResponseData.responseOK, nil)]
        let fakeSession = URLSession(configuration: sessionConfiguration)
        let sut: TranslateService = .init(session: fakeSession)

        let expectation = XCTestExpectation(description: "hello")
        sut.getTranslation(textToTranslate: "Bonjour", languageTarget: "en") {result in
            guard case .failure(let error) = result else { return }
            XCTAssertTrue(error == .undecodableData)
            XCTAssertTrue(error.description == "Decoding problem")
           expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

}
