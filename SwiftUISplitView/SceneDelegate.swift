//
//  SceneDelegate.swift
//  SwiftUISplitView
//
//  Created by Ponraj, Rooban (Rooban Abraham) on 22/04/20.
//  Copyright © 2020 Rooban Abraham. All rights reserved.
//

import UIKit
import SwiftUI


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
        
        let  accountListModel = [AccountViewModel(accountName: "Checking 12345", amount: "$8000.00", amountLbl: "Available Balance", asOfDate: "05/25/2020",transactionList: [TransactionViewModel(transactionDescription: "Purchased in Walmart", transactionAmount: "$300.00"),TransactionViewModel(transactionDescription: "Purchased in Target", transactionAmount: "$30.00"),TransactionViewModel(transactionDescription: "Dinning", transactionAmount: "$30.40"),TransactionViewModel(transactionDescription: "ATM withdraw", transactionAmount: "$300.00"),TransactionViewModel(transactionDescription: "Online Debit", transactionAmount: "$600.00"),TransactionViewModel(transactionDescription: "Online Purchase", transactionAmount: "$100.00")]), AccountViewModel(accountName: "Saving 008", amount: "$7800.00", amountLbl: "Current Balance", asOfDate: "05/25/2020",transactionList: [TransactionViewModel(transactionDescription: "Purchased in Walmart", transactionAmount: "$300.00"),TransactionViewModel(transactionDescription: "Purchased in Traget", transactionAmount: "$30.00"),TransactionViewModel(transactionDescription: "Dinning", transactionAmount: "$30.40"),TransactionViewModel(transactionDescription: "ATM withdraw", transactionAmount: "$300.00"),TransactionViewModel(transactionDescription: "Online Debit", transactionAmount: "$600.00"),TransactionViewModel(transactionDescription: "Online Purchase", transactionAmount: "$100.00")])]
        
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: AccountsSplitView(accountViewModel: accountListModel[0], accountListModel: accountListModel))

            
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

