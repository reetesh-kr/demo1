//
//  demo1Tests.swift
//  demo1Tests
//
//  Created by Reetesh Kumar on 12/09/19.
//  Copyright © 2019 Reetesh Kumar. All rights reserved.
//

import XCTest
@testable import demo1

class demo1Tests: XCTestCase {

    var obj: LoginViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        obj = (storyboard.instantiateInitialViewController() as! LoginViewController)
        let _ = obj.view //calling viewDidLoad in case of unit test and preventing IBOutlet not to be nil
        obj.password?.text = "password@123"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        obj = nil
    }

    func test_title_in_loginscreen() {
        let expectedStringForTitle: String = "Login Screen"
        XCTAssertNotNil(expectedStringForTitle,"Expected Title can't be nil")
        XCTAssertEqual(expectedStringForTitle, obj.titleLabel!.text!)
    }
    
    func test_username_placeholder() {
        XCTAssertEqual("Enter Username", obj.username!.placeholder!)
    }
    
    func test_password_placeholder() {
        XCTAssertEqual("Enter Password", obj.password!.placeholder!)
    }
    
    func test_minimum_password_length() {
        let expectedStringForPassword: String = obj.password!.text!
        XCTAssertTrue(expectedStringForPassword.count>=8, "There should be minimum 8 characters of password")
    }
    
    func test_login_button_title() {
        XCTAssertEqual("Login", obj.loginButton!.titleLabel!.text!)
    }

}
