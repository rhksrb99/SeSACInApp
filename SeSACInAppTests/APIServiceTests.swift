//
//  APIServiceTests.swift
//  SeSACInAppTests
//
//  Created by 박관규 on 2022/12/01.
//

import XCTest
@testable import SeSACInApp

final class APIServiceTests: XCTestCase {

    var sut: APIService!
    
    override func setUpWithError() throws {
        sut = APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        print("testExample Start")
        
        sut.number = 100
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("callRequest")
        }
        
        print("testExample End")
    }

    // 비동기: expectation, fulfill, wait
    /*
     
     네트워크: 아이폰에서 네트워크가 끊긴다면, API 서버 점검을 한다면, API 지연이 된다면,,? 정확한 결과를 알 수 없다.
     효율적/속도/같은 조건에서 테스트를 해야한다.
     테스트 대상이 외부와 격리되어있지 않다면 -> 예측 불가능한 상황을 만들면 안된다.
     => 실제 네트워크 동작이 되는 것 처럼 보이게 별개의 객체를 만든다.
     => 테스트 더블(Test Double): 테스트 코드랑 상호작용할 수 있는 가짜 객체 생성(ex. 스턴트맨)
        ex. dummy, mock, fake, stub, spy...
     
     */
    
    func test_APILottoResponse_AsyncCover() throws {
        print("testExample Start")
        
        let promise = expectation(description: "waiting lotto number, completion handler invoked")
        
        sut.number = 25
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("callRequest")
            promise.fulfill() // expectation으로 정의된 테스트 조건을 충족!
        }
        
        print("testExample End")
        // 함수 내부 메서드를 완전히 끝내도록 기다리는 시간을 준다.
        wait(for: [promise], timeout: 5)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
