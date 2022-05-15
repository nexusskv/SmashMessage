//
//  AppDelegate+NotificationCenter.swift
//  SmashMessage
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import UIKit


extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func requestNotificationAuthorization(_ sender: AnyObject) {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Local Notifications Error: ", error)
            } else {
                DispatchQueue.main.async {
                    UNUserNotificationCenter.current().delegate = self
                    
                    self.sendNotification(sender)
                }
            }
        }
    }
    
    func sendNotification(_ sender: AnyObject) {
        let notificationContent                 = UNMutableNotificationContent()
        notificationContent.title               = "Solitaire smash"
        notificationContent.body                = "Play again to smash your top score"
        notificationContent.sound               = UNNotificationSound.default
        notificationContent.badge               = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        notificationContent.categoryIdentifier  = "com.smashmessage"
        
        if let url = Bundle.main.url(forResource: "AppIcon", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "AppIcon", url: url, options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        let request = UNNotificationRequest(identifier: "com.smashmessage",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            } else {
                print("\n Notification call triggered")
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification.request.content.body)

        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if #available(iOS 14, *) {
            completionHandler([.banner, .badge, .sound])
        } else {
            completionHandler([.alert, .badge, .sound])
        }
    }
}
