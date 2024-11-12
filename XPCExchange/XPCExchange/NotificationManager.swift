import Foundation
import UserNotifications
import UIKit

extension Date {
    var notificationComponents: DateComponents {
        return Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
    }
}

class NotificationManager {
    static let shared = NotificationManager()
    let current = UNUserNotificationCenter.current()
    var count: Int = 0

    func requestPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { suc, err in
            guard err == nil else {
                print("\(err!.localizedDescription)")
                return
            }
        }
    }
    
    func scheduleNotification(date: Date, title: String, subtitle: String) {
        print("Running..?")
        count += 1
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = count as NSNumber

        let trigger = UNCalendarNotificationTrigger(dateMatching: date.notificationComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        current.add(request)
    }

    func scheduleNotification() {
        count += 1
        let content = UNMutableNotificationContent()
        content.title = "Woah"
        content.subtitle = "Why do you still have this?"
        content.sound =  .default
        content.badge = count as NSNumber

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    func resetBadgeNumber() {
        count = 0
        if #available(iOS 16.0, *) {
            UNUserNotificationCenter.current().setBadgeCount(0)
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
