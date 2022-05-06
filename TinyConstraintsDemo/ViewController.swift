//
//  ViewController.swift
//  TinyConstraintsDemo
//
//  Created by Sergey Lukaschuk on 24.04.2022.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

    // MARK: - Views
    let navBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

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

    lazy var businessInformationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var gridView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Hello"

        addViews()
        addConstraints()
    }
}

// MARK: -
extension ViewController {
    private func addViews() {
        view.addSubview(navBar)
        view.addSubview(timeBarButtonItem)
        view.addSubview(menuBarButtonItem)
        view.addSubview(textDescription)
        view.addSubview(businessInformationView)
        view.addSubview(gridView)
    }

    //MARK: - Constraints
    private func addConstraints() {
        addNavBar()
        addTimeBarButtonItem()
        addMenuBarButtonItem()
        addTextDescription()
        addBusinessInformationView()
        addGridView()
    }

    private func addNavBar() {
        navBar.height(100)
        navBar.alpha = 0.5
        navBar.edgesToSuperview(excluding: .bottom)
        addBorder(to: navBar, position: .bottom)
    }

    private func addTimeBarButtonItem() {
        timeBarButtonItem.leadingToSuperview(offset: 8)
        timeBarButtonItem.bottom(to: navBar, offset: -8)
        timeBarButtonItem.size(CGSize(width: 45, height: 45))
    }

    private func addMenuBarButtonItem() {
        menuBarButtonItem.trailingToSuperview(offset: 8)
        menuBarButtonItem.bottom(to: navBar, offset: -8)
        menuBarButtonItem.size(CGSize(width: 45, height: 45))
    }

    private func addTextDescription() {
        textDescription.height(40)
        textDescription.leadingToSuperview()
        textDescription.trailingToSuperview()
        textDescription.topToBottom(of: navBar)
    }

    private func addBusinessInformationView() {
        businessInformationView.height(400)
        businessInformationView.topToBottom(of: textDescription)
        businessInformationView.leadingToSuperview()
        businessInformationView.trailingToSuperview()
        addBorder(to: businessInformationView, position: .top)
        addBorder(to: businessInformationView, position: .bottom)
    }

    private func addGridView() {
        gridView.height(40)
        gridView.leadingToSuperview()
        gridView.trailingToSuperview()
        gridView.topToBottom(of: businessInformationView)
        addBorder(to: gridView, position: .bottom)
    }

    // MARK: - Border
    private func addBorder(to view: UIView, position: Position) {

        let border = UIView()
        view.addSubview(border)
        border.backgroundColor = .black
        border.alpha = 0.3
        border.height(1)

        switch position {
            case .top: border.edgesToSuperview(excluding: .bottom)
            case .bottom: border.edgesToSuperview(excluding: .top)
        }
    }
}

enum Position {
    case top
    case bottom
}
