//
//  Day03.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 03/12/24.
//

struct Day03: AdventDay {
	var data: String

	var entities: String {
		"do()\(data)"
	}

	func part1() -> Any {
		var ans = 0
		let reg = /mul\((\d+),(\d+)\)/

		entities.matches(of: reg).forEach {
			ans += Int($0.1)! * Int($0.2)!
		}

		return ans
	}

	func part2() -> Any {
		var ans = 0

		let reg1 = /do\(\)|don't\(\)/
		let reg2 = /mul\((\d+),(\d+)\)/

		let splits = entities.split(separator: reg1)
		let separators = entities.matches(of: reg1)
		splits.enumerated().forEach { index, split in
			if separators[index].output == "do()" {
				split.matches(of: reg2).forEach {
					ans += Int($0.1)! * Int($0.2)!
				}
			}
		}

		return ans
	}
}
