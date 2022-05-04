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

//    lazy var oldConstraints = tinyView1.size(CGSize(width: 100, height: 100), isActive: false)
    lazy var newConstraints = tinyView1.size(CGSize(width: 300, height: 200), isActive: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        addConstraints()
    }
}

extension ViewController {
    private func addConstraints() {
        view.addSubview(tinyView1)
        tinyView1.originToSuperview(insets: TinyEdgeInsets(top: 10, left: 10, bottom: 0, right: 0), usingSafeArea: true)

        newConstraints.activate()

        UIViewPropertyAnimator(duration: 5, dampingRatio: 0.4) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}
