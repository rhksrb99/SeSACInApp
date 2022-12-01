//
//  SeSACInAppUITests.swift
//  SeSACInAppUITests
//
//  Created by 박관규 on 2022/11/29.
//

import XCTest

final class SeSACInAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication() // 앱의 실행과 종료를 돕는다
        app.launch()
        
        app.textFields["emailTextField"].tap() // .tap() -> 클릭하게 한다.
        app.textFields["emailTextField"].typeText("kidult@kidult.com") // .typeText() -> 텍스트를 입력한다.
        
    }
    
    // 추가적으로 함수를 생성할 수 있다.
    func testLoginExample() throws {

        let app = XCUIApplication()
        app.launch()
        
        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("kidult@kidult.com")
        
        // 간단한 유효성검사를 할 수 있다.
//        XCTAssertEqual(5, 9)
        
        app.textFields["PasswordTextField"].tap()
        app.textFields["PasswordTextField"].typeText("12345678")
        
        app.textFields["checkTextField"].tap()
        app.textFields["checkTextField"].typeText("12345678")
        
        // 각 객체의 identifire를 지정하고 사용할 수 있지만
        // 독립적인 객체의 타이틀을 통해 접근할 수도 있다.
        app.staticTexts["로그인하기"].tap()
        
        let label = app.staticTexts.element(matching: .any, identifier: "descriptionLabel").label
        XCTAssertEqual(label, "로그인 버튼 클릭")
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
