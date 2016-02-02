//
//  PushNotificationQueue.swift
//  P-effect
//
//  Created by Jack Lapin on 02.02.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

class PushNotificationQueue: NSObject {
    
    static var notificationQueue = [String]()
    
    class func handleNotificationQueue() {
        NSTimer.scheduledTimerWithTimeInterval(
            2,
            target: PushNotificationQueue.self,
            selector: "showNotificationFromQueue",
            userInfo: nil,
            repeats: false
        )
    }
    
    class func addObjectInQueue(message: String?) {
        guard let message = message else {
            return
        }
        notificationQueue.append(message)
    }
    
    class func clearQueue() {
        notificationQueue = []
    }
    
    private func countOfNotificationsInQueue() -> Int {
        return PushNotificationQueue.notificationQueue.count
    }
    
    class func showNotificationFromQueue() {
        if notificationQueue.count == 1 {
            AlertService.notificationAlert(message: notificationQueue.first)
        } else if notificationQueue.count > 1 {
            AlertService.notificationAlert(
                message: String(notificationQueue.count) + " new amazing posts!"
            )
        }
    }
    
}
