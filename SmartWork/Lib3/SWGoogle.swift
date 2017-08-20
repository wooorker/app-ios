//
//  SWGoogle.swift
//  SmartWork
//
//  Created by apple on 2017/8/13.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

private let GoogleClientID = "216548526687-2b6g72cj6b711o4iicdhe4kubijvfl30.apps.googleusercontent.com"

typealias SWGoogleSSOAuthBlock = (_ jsonData: NSDictionary) ->Void

class SWGoogle: NSObject, GIDSignInDelegate {
    static let shareSingleTon: SWGoogle = {
        let instance = SWGoogle()

        GIDSignIn.sharedInstance().clientID = GoogleClientID
        GIDSignIn.sharedInstance().delegate = instance
        return instance
    }()
    
    // [START signin_handler]
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // [START_EXCLUDE]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"),
                object: nil,
                userInfo: ["statusText": "Signed in user:\n\(fullName)"])
            // [END_EXCLUDE]
        }
    }
    // [END signin_handler]
    // [START disconnect_handler]
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
        // [END_EXCLUDE]
    }
    // [END disconnect_handler]
    
    func logout() -> Void {
        GIDSignIn.sharedInstance().signOut()
    }
    
    
}
