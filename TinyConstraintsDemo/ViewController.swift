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

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg gggggggggggggggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg gggggggggggggggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg gggggggggggggggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg ggggggggggggg gggggggggggggggggggggggggg ggggggggggggg ggggggggggggg g"
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        addConstraints()
    }
}

extension ViewController {
    private func addConstraints() {
        view.addSubview(tinyView1)
        tinyView1.edgesToSuperview(excluding: .bottom, insets: .uniform(32), usingSafeArea: true)

        tinyView2.height(100)
        tinyView1.stack([tinyView2, label], axis: .vertical, spacing: 10)
    }
}
