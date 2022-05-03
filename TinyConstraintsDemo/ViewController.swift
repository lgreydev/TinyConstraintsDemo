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
        tinyView1.width(200)
        tinyView1.height(200)
        tinyView1.centerInSuperview(offset: CGPoint(x: 0, y: -200))

        view.addSubview(tinyView2)
        tinyView2.width(to: tinyView1, multiplier: 1, offset: 50)
        tinyView2.height(to: tinyView1, multiplier: 1)
        tinyView2.centerInSuperview(offset: CGPoint(x: 0, y: 20))

        view.addSubview(tinyView3)
        tinyView3.width(100)
        tinyView3.aspectRatio(1)
        tinyView3.centerInSuperview(offset: CGPoint(x: 0, y: 200))
    }
}
