//
//  Day05.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 05/12/24.
//

import Foundation

struct Day05: AdventDay {
	var data: String

	var rules: [(Int, Int)] {
		let reg = /(\d+)\|(\d+)/
		return data.components(separatedBy: "\n\n").first!.components(separatedBy: "\n").map {
			let match = $0.wholeMatch(of: reg)!
			return (Int(match.output.1)!, Int(match.output.2)!)
		}
	}

	var updates: [[Int]] {
		data.components(separatedBy: "\n\n").last!.components(separatedBy: "\n").map {
			$0.components(separatedBy: ",").compactMap { Int($0) ?? nil }
		}.filter { !$0.isEmpty }
	}

	private func validate(_ update: [Int], _ rule: [(Int, Int)]) -> Bool {
		return
			rules.filter { update.contains($0.0) && update.contains($0.1) }
			.allSatisfy { update.firstIndex(of: $0.0)! < update.firstIndex(of: $0.1)! }
	}

	func part1() -> Int {
		var ans = 0
		for update in updates {
			if validate(update, rules) {
				ans += update[(update.count-1)/2]
			}
		}
		return ans
	}

	func part2() -> Int {
		var ans = 0
		for update in updates {
			if !validate(update, rules) {
				let sortedUpdate = update.sorted { a,b in
					!rules.contains(where: { $0.0 == b && $0.1 == a })
				}
				ans += sortedUpdate[(sortedUpdate.count-1)/2]
			}
		}
		return ans
	}
}
