//
//  FinancialControlTests.swift
//  FinancialControlTests
//
//  Created by Manoel Leal on 12/04/22.
//

import XCTest
@testable import FinancialControl

class FinancialControlViewModelTests: XCTestCase {
    
    var listViewModel: ListViewModel!

    override func setUpWithError() throws {
        listViewModel = ListViewModel()
    }

    override func tearDownWithError() throws {
        listViewModel.items.removeAll()
    }

    
    func testAddFinancialIssue(){
        listViewModel.addItem(description: "Teste", value: 50.0)
        XCTAssertEqual(listViewModel.items.count, 1)
        XCTAssertEqual(listViewModel.items[0].description, "Teste")
        XCTAssertEqual(listViewModel.items[0].value, 50.0)
    }
    
}
