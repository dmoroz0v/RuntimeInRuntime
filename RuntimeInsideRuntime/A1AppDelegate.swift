//
//  TAppDelegate.swift
//  RuntimeInsideRuntime
//
//  Created by Denis S. Morozov on 10.07.2022.
//

import Foundation
import UIKit

class A1AppDelegate: RIRAppDelegate {

    var window: RIRWindow!

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) -> Bool {
        let nvc = UINavigationController(rootViewController: A1ViewController())
        window.rootViewController = nvc
        return true
    }

}

class A1ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = .red

        let b = UIButton(type: .custom)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("push me", for: .normal)
        b.addTarget(self, action: #selector(pushMe), for: .touchUpInside)

        view.addSubview(b)

        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: b.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: b.centerYAnchor),
        ])
    }

    @objc func pushMe() {
        navigationController?.pushViewController(A1ViewController(), animated: true)
    }
}
