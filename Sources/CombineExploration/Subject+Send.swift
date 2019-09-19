//
//  Subject+Send.swift
//  CombineExploration
//
//  Created by Matt Gallagher on 16/7/19.
//  Copyright © 2019 Matt Gallagher ( https://www.cocoawithlove.com ). All rights reserved.
//

import OpenCombine

public extension Subject {
	func send<S: Sequence>(sequence: S, completion: Subscribers.Completion<Self.Failure>? = nil) where S.Element == Self.Output {
		for v in sequence {
			send(v)
		}
		if let completion = completion {
			send(completion: completion)
		}
	}
}
