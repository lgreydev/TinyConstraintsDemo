//
//  ViewController.swift
//  TinyConstraintsDemo
//
//  Created by Sergey Lukaschuk on 24.04.2022.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

// MARK: -  View
    let navBar = TinyView(backgroundColor: .lightGray, cornerRadius: 0, borderWidth: 0)


// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelf()
        addConstraints()
    }
}

// MARK: - Extension VC
extension ViewController {
    private func setupSelf() {
        view.backgroundColor = .white
        title = "Hello"
    }

    private func addConstraints() {
        view.addSubview(navBar)
        navBar.edgesToSuperview(excluding: .bottom)
        navBar.height(100)
    }
}
