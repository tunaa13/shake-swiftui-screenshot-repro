//
//  TimerViewModel.swift
//  Ratios
//
//  Created by John Peden on 2/27/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import Foundation
import Combine
import Shake

class TimerViewModel {
    public var timer = Timer.publish(every: 1, on: .current, in: .common)
    private var cancellableTimer: Cancellable?

    public func start() {
        
//            let arr = [1, 2, 3]
//            let myVar = arr[5]
//        Shake.unregisterUser();
        Shake.log(ShakeLogLevel.LogLevelInfo, "Log message goes here!")
        Shake.show()
        cancellableTimer = timer.connect()
    }

    public func stop() {
        guard let cTimer = cancellableTimer else {
            return
        }

        cTimer.cancel()
        Shake.registerUser(userId: "ivan.antunovic@shakebugs.comdddcchh");
        DispatchQueue.global().async {
            while true {
                print("spam")
                usleep(200) // controlled rate
            }
        }
//        Shake.clearMetadata();
        timer = Timer.publish(every: 1, on: .current, in: .common)
    }
}
