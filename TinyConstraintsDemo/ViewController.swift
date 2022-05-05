//
//  ViewController.swift
//  TinyConstraintsDemo
//
//  Created by Sergey Lukaschuk on 24.04.2022.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

// MARK: - View
    let navBar = TinyView(backgroundColor: .lightGray, cornerRadius: 0, borderWidth: 0)
    let borderBar = TinyView(backgroundColor: .gray, cornerRadius: 0, borderWidth: 0)
    let borderBarSecond = TinyView(backgroundColor: .gray, cornerRadius: 0, borderWidth: 0)

    lazy var timeBarButtonItem: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "NavigationBarButtonItemTime")
        return view
    }()

    lazy var menuBarButtonItem: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "NavigationBarButtonItemMenu")
        return view
    }()

    lazy var textDescription: UITextView = {
        let view = UITextView()
        let myString = "61 profile visits in the last 7 days"
        let style = NSMutableParagraphStyle()

        style.alignment = .center

        let myAttribute = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Thin", size: 18.0)!,
            NSAttributedString.Key.paragraphStyle: style
            ]

        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)

        view.attributedText = myAttrString
        return view
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Hello"

        addConstraints()
    }
}

// MARK: - Constraints
extension ViewController {
    private func addConstraints() {
        view.addSubview(navBar)
        navBar.height(100)
        navBar.alpha = 0.5
        navBar.edgesToSuperview(excluding: .bottom)

        view.addSubview(borderBar)
        borderBar.height(1)
        borderBar.leadingToSuperview()
        borderBar.trailingToSuperview()
        borderBar.topToBottom(of: navBar)

        view.addSubview(timeBarButtonItem)
        timeBarButtonItem.leadingToSuperview(offset: 8)
        timeBarButtonItem.bottom(to: navBar, offset: -8)
        timeBarButtonItem.size(CGSize(width: 45, height: 45))

        view.addSubview(menuBarButtonItem)
        menuBarButtonItem.trailingToSuperview(offset: 8)
        menuBarButtonItem.bottom(to: navBar, offset: -8)
        menuBarButtonItem.size(CGSize(width: 45, height: 45))

        view.addSubview(textDescription)
        textDescription.height(40)
        textDescription.leadingToSuperview()
        textDescription.trailingToSuperview()
        textDescription.topToBottom(of: borderBar)

        view.addSubview(borderBarSecond)
        borderBarSecond.height(1)
        borderBarSecond.leadingToSuperview()
        borderBarSecond.trailingToSuperview()
        borderBarSecond.topToBottom(of: textDescription)

        view.addSubview(containerView)
        containerView.topToBottom(of: borderBarSecond)
        containerView.edgesToSuperview(excluding: .top)
    }
}
