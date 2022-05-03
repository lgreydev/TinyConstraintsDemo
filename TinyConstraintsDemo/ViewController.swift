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
        view.addSubview(tinyView1)
        tinyView1.originToSuperview(insets: TinyEdgeInsets(top: 32, left: 10, bottom: 0, right: 0), usingSafeArea: true)
        tinyView1.size(CGSize(width: 200, height: 200))

        view.addSubview(tinyView2)
        tinyView2.leadingToTrailing(of: tinyView1, offset: 32)
        tinyView2.topToSuperview(offset: 32, usingSafeArea: true)
        tinyView2.size(CGSize(width: 100, height: 100))

        view.addSubview(tinyView3)
        tinyView3.topToBottom(of: tinyView1, offset: 10)
        tinyView3.leading(to: view, offset: 10)
        tinyView3.size(CGSize(width: 100, height: 100))
    }
}
