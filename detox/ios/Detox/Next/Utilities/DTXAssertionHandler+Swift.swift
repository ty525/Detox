//
//  DTXAssertionHandler+Swift.swift
//  Detox
//
//  Created by Leo Natan (Wix) on 4/30/20.
//  Copyright © 2020 Wix. All rights reserved.
//

import UIKit

func dtx_try<T: Any>(_ block: () -> T) throws -> T {
	return try DTXAssertionHandler.__try(block) as! T
}

func dtx_fatalError(_ message: @autoclosure () -> String = String(), view: @autoclosure () -> UIView? = nil, function: String = #function, file: String = #file, line: UInt = #line) -> Never {
	DTXAssertionHandler.handleFailure(inFunction: function, file: file, lineNumber: Int(line), view: view(), description: message(), arguments: getVaList([]))
	abort()
}

func dtx_assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), view: @autoclosure () -> UIView? = nil, function: String = #function, file: String = #file, line: UInt = #line) {
	guard condition() else {
		DTXAssertionHandler.handleFailure(inFunction: function, file: file, lineNumber: Int(line), view: view(), description: message(), arguments: getVaList([]))
		
		return
	}
}
