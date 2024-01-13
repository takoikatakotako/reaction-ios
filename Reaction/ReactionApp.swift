import SwiftUI
import Firebase
import FirebaseMessaging
import GoogleMobileAds
import UserNotifications

@main
struct reactionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

//
// import SwiftUI
//
// struct ContentView: View {
//     let publisher = NotificationCenter.default.publisher(for: .deviceToken)
//    @State var deviceToken: String = ""
//    
//    var body: some View {
//        VStack {
//            Text("DeviceToken")
//            TextField("Device Token is Empty", text: $deviceToken)
//                .padding()
//        }
//        .onReceive(publisher) { message in
//            if let deviceToken = message.object as? String {
//                self.deviceToken = deviceToken
//            }
//        }
//    }
// }
