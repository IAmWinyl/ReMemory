//
//  Notification.swift
//  ReMemory
//
//  Created by Serra Abak on 5/15/23.
//

import Foundation
import UserNotifications


class Notifications {
    
    public static func getPermissions() async throws {
        try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
    }
    
    public static func setNotification(memories: [Memory]) async throws {
        if memories.isEmpty {
            return
        }
        
        let memoryToNotify = memories[Int.random(in: 0..<memories.count)]
        let content = UNMutableNotificationContent()
        content.title = "Remember this?"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        try await UNUserNotificationCenter.current().add(request)
    }
}
