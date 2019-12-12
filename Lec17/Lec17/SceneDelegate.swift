//
//  SceneDelegate.swift
//  Lec17
//
//  Created by HACKERU on 12/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let window = window else { return }
        //declare variables for the MasterNav
        //declare variables for the DetailsNav
        //declare variables for the MasterViewControler
        //declare variables for the DetailsViewControler
        
        
        
        
        //splitViewcontroller
        guard let splitViewController = window.rootViewController as? UISplitViewController else { return }
        
        
        //DetailsViewController.nav:
        guard let navigationController = splitViewController.viewControllers.last as? UINavigationController else { return }
        
        //DetailsViewController
        navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
        //allways show the button:
        splitViewController.preferredDisplayMode = .allVisible
        
        
        //DetailsViewController
        navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
        
        //be the delegate
        splitViewController.delegate = self
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

    // MARK: - Split view
    //return true -> collapse the details
    //return false -> show the details
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        
        //DetailsViewController.nav:
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return true }
        
        //DetailsViewController
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return true }
        
        
        //return true to collapse
        return topAsDetailController.detailItem == nil
        
    }

}

