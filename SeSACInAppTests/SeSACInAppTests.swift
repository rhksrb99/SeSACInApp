//
//  SeSACInAppTests.swift
//  SeSACInAppTests
//
//  Created by 박관규 on 2022/11/29.
//

import XCTest
@testable import SeSACInApp // 다른 Target은 임포트를 하게되면 내부 코드를 가져올 수 있다.
// import 앞에 @testable을 추가하게 되면 접근제어에 구속받지않고 내부 코드를 가져올 수 있다.
// private 제외!

final class SeSACInAppTests: XCTestCase {

    var sut: LoginViewController!
    // system under test 의 약자 -> 테스트를 하고자 하는 클래스를 정의할 때 사용한다.
    
    override func setUpWithError() throws {
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded() // 스토리보드 및 @IBOutlet 시에 필요!
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 이메일 유효성 테스트
    // TDD : Given, when, Then
    // BDD : Arrange, Act, Assert
//    func testLoginViewController_validEmail_returnTrue() throws {
//        // 테스트 객체 : Given  <->  Arrange
//        sut.tf_email.text = "kidult@kidult.com"
//        // 테스트 조건/행동 : When  <->  Act
//        let valid = sut.isValidEmail()
//        // 테스트 결과 : Then  <->  Assert
//        XCTAssertTrue(valid)
//        
//    }
//    
//    func testLoginViewController_invalidPassword_returnFalse() throws {
//        sut.tf_password.text = "1234"
//        let valid = sut.isValidPassword()
//        XCTAssertFalse(valid)
//    }
//    
//    func testLoginViewController_emailTextField_returnNil() throws {
//        sut.tf_email = nil
//        let value = sut.tf_email
//        XCTAssertNil(value)
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
