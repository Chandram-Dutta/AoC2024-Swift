//
//  Day01.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 01/12/24.
//

struct Day01: AdventDay {
	var data: String

	var entities: ([Int], [Int]) {
		var r = [Int]()
		var l = [Int]()
		data.split(separator: "\n").forEach {
			let reg = /(\d+)   (\d+)/
			let matches = try! reg.wholeMatch(in: String(describing: $0))
			r.append(Int(matches!.1)!)
			l.append(Int(matches!.2)!)
		}
		return (r, l)
	}

	func part1() -> Any {

		var (r, l) = entities

		r.sort()
		l.sort()

		var ans = 0

		r.enumerated().forEach { i, r in
			ans += abs(r - l[i])
		}

		return ans
	}

	func part2() -> Any {

		let (r, l) = entities

		var ans = 0

		r.forEach { num in
			let occ = l.count(where: { $0 == num })
			ans += occ * num
		}

		return ans
	}
}
