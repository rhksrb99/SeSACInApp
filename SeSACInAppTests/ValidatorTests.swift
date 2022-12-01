//
//  ValidatorTests.swift
//  SeSACInAppTests
//
//  Created by 박관규 on 2022/11/30.
//

import XCTest
@testable import SeSACInApp

final class ValidatorTests: XCTestCase {

    var sut: Validator!
    let user = User(email: "kidult@kidult.com", password: "1234", check: "1234")
    
    override func setUpWithError() throws {
        // 테스트를 하기 전 초기화 시켜준다.
        // 인스턴스 생성
        // 실행와 종료에 인스턴스를 생성, 해제를 하는 이유(Repeatable) -> 다른 테스트에 영향을 주지않고 고립되게 이루어진다.
        sut = Validator()
    }

    override func tearDownWithError() throws {
        // 테스트가 끝나면 값에 nil을 준다.
        // 인스턴스 해제
        sut = nil
    }

    // 유닛테스트는 빠르게 되어야한다. -> 작은 단위로 이루어진다.
    // 항상 같은 결과가 나와야한다.
    // 네트워크 비동기 테스트는 고려할 점이 많아진다.
    func testValidator_validEmail_returnTrue() throws {
        
        let valid = sut.isVaidEmail(email: user.email)
        
        XCTAssertTrue(valid)
        
    }
    
    func testValidator_validPassword_returnTrue() throws {
        
        let valid = sut.isValidPassword(password: user.password)
        
        XCTAssertTrue(valid)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
