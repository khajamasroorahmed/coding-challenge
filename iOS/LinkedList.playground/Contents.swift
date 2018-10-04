//: Playground - noun: a place where people can play

class LinkedListNode<T: Equatable>: Equatable {
    let item: T
    weak var next: LinkedListNode?

    init(item: T, next: LinkedListNode<T>?) {
        self.item = item
        self.next = next
    }
    
    static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
        if lhs.item == rhs.item {
            if lhs.next == rhs.next {
                return true
            }
        }
        return false
    }
}

class LinkedList<T: Equatable> {
    var head: LinkedListNode<T>?
    init(head: LinkedListNode<T>?) {
        self.head = head
    }

    public var isEmpty: Bool {
        return (head == nil)
    }

    public func addElement(item: LinkedListNode<T>) {
        guard var tempHead = head else {
            head = item
            return
        }
        while(tempHead.next != nil) {
            if let tempheadNext = tempHead.next {
                tempHead = tempheadNext
            }
        }
        tempHead.next = item
    }

    public func removeElement() -> LinkedListNode<T>? {
        guard let tempHead = head else {
            return nil
        }
        head = tempHead.next
        return tempHead
    }

    public func iterate() {
        var tempHead = head
        while(tempHead?.next != nil) {
            if let tempheadNext = tempHead?.next {
                tempHead = tempheadNext
            }
        }
    }

    public func getHead() -> LinkedListNode<T>? {
        return head
    }
}

import XCTest

class LinkedListTest: XCTestCase {
    func testEmpty() {
        let linkedList = LinkedList<Int>(head: nil)
        XCTAssertTrue(linkedList.isEmpty)
        XCTAssertEqual(linkedList.getHead(), nil)
        XCTAssertNil(linkedList.removeElement())
    }

    func testTwoElements() {
        let linkedList = LinkedList<Int>(head: nil)
        let l1 = LinkedListNode(item: 1, next: nil)
        let l2 = LinkedListNode(item: 2, next: nil)
        linkedList.addElement(item: l1)
        linkedList.addElement(item: l2)
        XCTAssertFalse(linkedList.isEmpty)
        XCTAssertNotEqual(linkedList.getHead(), nil)
        let element = linkedList.removeElement()
        XCTAssertNotNil(element?.item)
        XCTAssertEqual(element?.item, 1)
        if let linkedListHead = linkedList.head {
            XCTAssertEqual(linkedListHead, l2)
            XCTAssertEqual(linkedList.getHead(), l2)
        }
    }
}

LinkedListTest.defaultTestSuite.run()


