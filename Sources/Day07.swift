//
//  Day07.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 07/12/24.
//

import Foundation

struct Calibration {
	let final: Int
	let list: [Int]
}

struct Day07: AdventDay {
	var data: String
	
	var entities: [Calibration] {
		data.split(separator: "\n").map {
			let line = $0.split(separator: ": ")
			let num = Int(line.first!)!
			let nums = line.last!.split(separator: " ").map {
				Int($0)!
			}
			return Calibration(final: num, list: nums)
		}
	}
	
	func checkFinal(num: Int, list: [Int], final: Int, nextIndex: Int) -> Bool {
		
		guard num <= final else {
			return final == num
		}
		
		if nextIndex == list.count {
			return final == num
		}
		
		return checkFinal(
			num: num + list[nextIndex],
			list: list,
			final: final,
			nextIndex: nextIndex + 1
		) ||
		checkFinal(
			num: num * list[nextIndex],
			list: list,
			final: final,
			nextIndex: nextIndex + 1
		)
	}
	
	func checkFinalWithConcat(num: Int, list: [Int], final: Int, nextIndex: Int) -> Bool {
		
		guard num <= final else {
			return final == num
		}
		
		if nextIndex == list.count {
			return final == num
		}
		
		return checkFinalWithConcat(
			num: num + list[nextIndex],
			list: list,
			final: final,
			nextIndex: nextIndex + 1
		) ||
		checkFinalWithConcat(
			num: num * list[nextIndex],
			list: list,
			final: final,
			nextIndex: nextIndex + 1
		) ||
		checkFinalWithConcat(
			num: Int("\(num)\(list[nextIndex])")!,
			list: list,
			final: final,
			nextIndex: nextIndex + 1
		)
	}
	
	func part1() -> Int {
		var ans = 0
		for entity in entities {
			if checkFinal(
				num: entity.list.first!, list: entity.list, final: entity.final, nextIndex: 1
			) {
				ans += entity.final
			}
		}
		return ans
	}
	
	func part2() -> Int {
		var ans = 0
		for entity in entities {
			if checkFinalWithConcat(
				num: entity.list.first!, list: entity.list, final: entity.final, nextIndex: 1
			) {
				ans += entity.final
			}
		}
		return ans
	}
}
