//
//  ViewController.swift
//  TinyConstraintsDemo
//
//  Created by Sergey Lukaschuk on 24.04.2022.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {
    let tinyView0 = TinyView(backgroundColor: .link, cornerRadius: 0, borderWidth: 0)
    let tinyView1 = TinyView(backgroundColor: .red)
    let tinyView2 = TinyView(backgroundColor: .green)
    let tinyView3 = TinyView(backgroundColor: .yellow)
    let tinyView4 = TinyView(backgroundColor: .cyan)
    let tinyView5 = TinyView(backgroundColor: .orange)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        addConstraints()
    }
}

extension ViewController {
    private func addConstraints() {
        view.addSubview(tinyView0)
        tinyView0.horizontalToSuperview(insets: TinyEdgeInsets(top: 0, left: 10, bottom: 0, right: 50), usingSafeArea: false)

        tinyView0.topToSuperview(offset: 0, usingSafeArea: true)
        tinyView0.bottomToSuperview()
    }
}
