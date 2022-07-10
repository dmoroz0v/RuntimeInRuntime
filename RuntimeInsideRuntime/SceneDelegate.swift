//
//  SceneDelegate.swift
//  RuntimeInsideRuntime
//
//  Created by Denis S. Morozov on 10.07.2022.
//

import UIKit

class UIWindow2: UIWindow {
    private var windows: [RIRWindow] = []

    func addWindow(_ window: RIRWindow) {
        windows.append(window)
        window.rootViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        rootViewController!.view.addSubview(window.rootViewController!.view)
    }
    
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var apps: [RIRAppDelegate] = []

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow2(windowScene: windowScene)
        window!.makeKeyAndVisible()
        window!.rootViewController = ViewController()

        apps = [
            {
                let app1 = A1AppDelegate()
                app1.window = RIRWindow()
                _ = app1.scene(scene, willConnectTo: session, options: connectionOptions)
                (self.window as! UIWindow2).addWindow(app1.window)
                return app1
            }(),
            {
                let app2 = A1AppDelegate()
                app2.window = RIRWindow()
                _ = app2.scene(scene, willConnectTo: session, options: connectionOptions)
                (self.window as! UIWindow2).addWindow(app2.window)
                return app2
            }(),
        ]
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

