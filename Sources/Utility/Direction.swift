//
//  Direction.swift
//  AdventOfCode
//
//  Created by Chandram Dutta on 07/12/24.
//

struct Direction: Equatable {
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
	static let cardinal: [Direction] = [u, r , d, l]
	static let diag: [Direction] = [lu, rd, ld, rd]
	
	func turnRightCardinal() -> Direction {
		switch self {
			case .u: return .r
			case .r: return .d
			case .d: return .l
			case .l: return .u
			default: return self
		}
	}
}
