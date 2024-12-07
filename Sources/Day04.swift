//
//  Day04.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 04/12/24.
//

import Algorithms
import Foundation

struct Point: Equatable {
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

struct Direction {
	let deltaX: Int
	let deltaY: Int

	static let l = Direction(deltaX: -1, deltaY: 0)
	static let r = Direction(deltaX: 1, deltaY: 0)
	static let u = Direction(deltaX: 0, deltaY: -1)
	static let d = Direction(deltaX: 0, deltaY: 1)
	static let lu = Direction(deltaX: -1, deltaY: -1)
	static let ru = Direction(deltaX: 1, deltaY: -1)
	static let ld = Direction(deltaX: -1, deltaY: 1)
	static let rd = Direction(deltaX: 1, deltaY: 1)

	static let all: [Direction] = [l, r, u, d, lu, ru, ld, rd]

	static let diag: [Direction] = [lu, rd, ld, rd]
}

struct Day04: AdventDay {

	var data: String

	var entities: [[Character]] {
		data.components(separatedBy: "\n").map {
			$0.map {
				$0
			}
		}.filter { !$0.isEmpty }
	}

	func search(_ point: Point, _ direction: Direction) -> Bool {
		var tempPoint = point
		for char in "MAS" {
			if !tempPoint.isInBounds(entities.count, entities.first!.count) {
				return false
			}
			if entities[tempPoint.x][tempPoint.y] != char {
				return false
			}
			tempPoint = tempPoint.next(direction)
		}
		return true
	}

	func searchMAS(_ point: Point) -> Bool {
		if entities[point.x][point.y] != "A" {
			return false
		}

		for direction in Direction.diag {
			if !point.next(direction).isInBounds(entities.count, entities.first!.count) {
				return false
			}
		}

		let diag1 = [
			entities[point.next(.lu).x][point.next(.lu).y],
			entities[point.next(.rd).x][point.next(.rd).y],
		]
		let diag2 = [
			entities[point.next(.ru).x][point.next(.ru).y],
			entities[point.next(.ld).x][point.next(.ld).y],
		]

		return Set([diag1.sorted(), diag2.sorted(), ["M", "S"].sorted()]).count == 1
	}

	func part1() -> Any {
		var ans = 0
		for i in entities.indices {
			print("line\(i)")
			for j in entities.first!.indices {
				let point = Point(x: i, y: j)
				for direction in Direction.all {
					if search(point, direction) {
						ans += 1
					}
				}
			}
		}
		return ans
	}

	func part2() -> Any {
		var ans = 0
		for i in entities.indices {
			print("line\(i)")
			for j in entities.first!.indices {
				let point = Point(x: i, y: j)
				if searchMAS(point) {
					ans += 1
				}
			}
		}
		return ans
	}
}
