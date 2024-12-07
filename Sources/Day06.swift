//
//  Day06.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 07/12/24.
//

import Foundation

struct Day06: AdventDay {
	var data: String
	
	var entities: [[Character]] {
		data.components(separatedBy: "\n").map {
			$0.map {
				$0
			}
		}.filter { !$0.isEmpty }
	}
	
	func part1() -> Int {
		var pathPoints = Set<Point>()
		let entityWithPointer = entities.filter {
			$0.contains("^")
		}.first!
		var point = Point(x: entityWithPointer.firstIndex(of: "^")!, y: entities.firstIndex(of: entityWithPointer)!)
		var direction = Direction.u
		pathPoints.insert(point)
		while true {
			let nextPoint = point.next(direction)
			if !nextPoint.isInBounds(entities.count, entities.first!.count) {
				break
			}
			if entities[nextPoint.y][nextPoint.x] == "#" {
				direction = direction.turnRightCardinal()
				point = point.next(direction)
				pathPoints.insert(point)
				continue
			}
			point = nextPoint
			pathPoints.insert(point)
		}
		return pathPoints.count
	}
	
	func part2() -> Int {
		var ans = 0
		return ans
	}
}
