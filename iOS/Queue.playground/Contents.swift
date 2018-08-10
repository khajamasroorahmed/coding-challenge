//: Playground - noun: a place where people can play

import UIKit
import XCTest

struct Queue<T> {
    fileprivate var array: [T] = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public var front: T? {
        return array.first
    }
}

class QueueTest: XCTestCase {
    func testEmpty() {
        var queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
        XCTAssertNil(queue.dequeue())
    }
    
    func testOneElement() {
        var queue = Queue<Int>()
        
        queue.enqueue(123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 123)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 123)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testTwoElements() {
        var queue = Queue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front, 123)
        
        let result1 = queue.dequeue()
        XCTAssertEqual(result1, 123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 456)
        
        let result2 = queue.dequeue()
        XCTAssertEqual(result2, 456)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func testMakeEmpty() {
        var queue = Queue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertNotNil(queue.dequeue())
        XCTAssertNotNil(queue.dequeue())
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(789)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 789)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 789)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
}

QueueTest.defaultTestSuite.run()
