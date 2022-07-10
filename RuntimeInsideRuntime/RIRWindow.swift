//
//  RIRWindow.swift
//  RuntimeInsideRuntime
//
//  Created by Denis S. Morozov on 10.07.2022.
//

import Foundation
import UIKit

protocol RIRAppDelegate {
    var window: RIRWindow! { get }

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) -> Bool

}

class RIRWindow {

    var rootViewController: UIViewController?

}
