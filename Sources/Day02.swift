//
//  Day02.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 02/12/24.
//

struct Day02: AdventDay {
	var data: String

	var entities: [[Int]] {
		data.split(separator: "\n").map {
			$0.split(separator: " ").compactMap {
				Int($0)
			}
		}
	}

	func part1() -> Any {
		var ans = 0

		entities.forEach {
			if $0.sorted() == $0 || $0.sorted().reversed() == $0 {
				let list = $0.sorted()
				var temp = list.first!
				var t = 0
				for i in 1..<list.count {
					temp = list[i - 1]
					if !(abs(temp - list[i]) > 0 && abs(temp - list[i]) < 4) {
						break
					}
					t += 1
				}
				if t == list.count - 1 {
					ans += 1
				}
			}
		}

		return ans
	}

	func part2() -> Any {
		var ans = 0

		entities.forEach {
			var t2 = 0
			for i in 0..<$0.count {
				var list = $0.enumerated().compactMap { n, c in
					n != i ? c : nil
				}
				if list.sorted() == list || list.sorted().reversed() == list {
					list = list.sorted()
					var temp = list.first!
					var t1 = 0
					for i in 1..<list.count {
						temp = list[i - 1]
						if !(abs(temp - list[i]) > 0 && abs(temp - list[i]) < 4) {
							break
						}
						t1 += 1
					}
					if t1 == list.count - 1 {
						t2 += 1
					}
				}

			}
			if t2 > 0 {
				ans += 1
			}
		}

		return ans
	}
}
