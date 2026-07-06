import UIKit
import Flutter
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // This is required to make any communication available in the action isolate.
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }

        getBatteryLevel()
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func getBatteryLevel() {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(
            name: "com.example.flutterpractice/device",
            binaryMessenger: controller.binaryMessenger
        )
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "getBatteryLevel":
                self?.handleGetBatteryLevel(result: result)
            default:
                result(FlutterMethodNotImplemented)
            }
        
        }
    }
    
    private func handleGetBatteryLevel(result: @escaping FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true

        guard device.batteryState != .unknown && device.batteryLevel >= 0.0 else {
            result(FlutterError.init(code: "UNAVAILABLE", message: "Battery level not available", details: nil))
            return
        }
        
        let batteryLevel = Int(device.batteryLevel * 100)
        result(batteryLevel)
    }
}
