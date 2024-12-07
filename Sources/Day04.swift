//
//  Day04.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 04/12/24.
//

import Foundation

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
