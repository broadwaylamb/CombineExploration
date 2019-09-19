//
//  File.swift
//  
//
//  Created by Matt Gallagher on 19/8/19.
//

import OpenCombine
import OpenCombineDispatch
import Foundation

class MainScheduler: Scheduler {

    var now: DispatchQueue.OCombine.SchedulerTimeType {
        return DispatchQueue.main.ocombine.now
	}
	
    var minimumTolerance: DispatchQueue.OCombine.SchedulerTimeType.Stride {
        return DispatchQueue.main.ocombine.minimumTolerance
	}
	
    func schedule(options: DispatchQueue.OCombine.SchedulerOptions?, _ action: @escaping () -> Void) {
		if Thread.current.isMainThread {
			action()
		} else {
            DispatchQueue.main.ocombine.schedule(options: options, action)
		}
	}

    func schedule(after date: DispatchQueue.OCombine.SchedulerTimeType, tolerance: DispatchQueue.OCombine.SchedulerTimeType.Stride, options: DispatchQueue.OCombine.SchedulerOptions?, _ action: @escaping () -> Void) {
        DispatchQueue.main.ocombine.schedule(after: date, tolerance: tolerance, options: options, action)
	}

    func schedule(after date: DispatchQueue.OCombine.SchedulerTimeType, interval: DispatchQueue.OCombine.SchedulerTimeType.Stride, tolerance: DispatchQueue.OCombine.SchedulerTimeType.Stride, options: DispatchQueue.OCombine.SchedulerOptions?, _ action: @escaping () -> Void) -> Cancellable {
        DispatchQueue.main.ocombine.schedule(after: date, interval: interval, tolerance: tolerance, options: options, action)
	}
}
