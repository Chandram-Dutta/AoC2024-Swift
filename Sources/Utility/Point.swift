//
//  Point.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 07/12/24.
//

struct Point: Equatable, Hashable {
	let x: Int
	let y: Int

	func isInBounds(_ row: Int, _ col: Int) -> Bool {
		self.x >= 0 && self.x < row && self.y >= 0 && self.y < col
	}

	static func == (_ self: Point, _ other: Point) -> Bool {
		self.x == other.x && self.y == other.y
	}

	func next(_ direction: Direction) -> Point {
		.init(x: self.x + direction.deltaX, y: self.y + direction.deltaY)
	}
}
