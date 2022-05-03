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
        tinyView0.edgesToSuperview(
            excluding: .bottom,
            insets: TinyEdgeInsets(top: 10, left: 10, bottom: 0, right: 10),
            usingSafeArea: true)
//        tinyView0.height(300)

        tinyView1.height(100)
        tinyView2.height(200)
        tinyView0.stack([tinyView1, tinyView2], axis: .vertical, spacing: 10)


        tinyView4.width(100)
        tinyView5.width(100)
        tinyView1.stack([tinyView4, tinyView5, UIView()], axis: .horizontal, spacing: 10)
    }
}
