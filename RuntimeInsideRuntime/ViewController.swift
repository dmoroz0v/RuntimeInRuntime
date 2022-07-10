//
//  ViewController.swift
//  RuntimeInsideRuntime
//
//  Created by Denis S. Morozov on 10.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        print("init")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        print("viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        print("viewDidLayoutSubviews")

        if view.subviews.isEmpty {
            return
        }

        view.subviews[0].transform = .init(scaleX: 1, y: 1)
        view.subviews[0].frame = view.bounds
        view.subviews[0].transform = .init(scaleX: 0.33, y: 0.33)
        view.subviews[0].transform = view.subviews[0].transform.translatedBy(
            x: -view.bounds.width / 1.5,
            y: -view.bounds.height / 1.5)

        if view.subviews.count > 1 {
            view.subviews[1].transform = .init(scaleX: 1, y: 1)
            view.subviews[1].frame = view.bounds
            view.subviews[1].transform = .init(scaleX: 0.33, y: 0.33)
            view.subviews[1].transform = view.subviews[1].transform.translatedBy(
                x: view.bounds.width / 1.5,
                y: view.bounds.height / 1.5)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        print("willMove")
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        print("didMove")
    }

    deinit {
        print("deinit")
    }


}

