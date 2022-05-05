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
    let firstLine = TinyView(backgroundColor: .gray, cornerRadius: 0, borderWidth: 0)
    let secondLine = TinyView(backgroundColor: .gray, cornerRadius: 0, borderWidth: 0)
    let thirdLine = TinyView(backgroundColor: .gray, cornerRadius: 0, borderWidth: 0)

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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Hello"

        addViews()
        addConstraints()

        let lines = [firstLine, secondLine, thirdLine]
        configureLines(lines)
    }
}

// MARK: -
extension ViewController {
    private func addViews() {
        view.addSubview(navBar)
        view.addSubview(firstLine)
        view.addSubview(timeBarButtonItem)
        view.addSubview(menuBarButtonItem)
        view.addSubview(textDescription)
        view.addSubview(secondLine)
        view.addSubview(businessInformationView)
        view.addSubview(thirdLine)
    }

    //MARK: - Constraints
    private func addConstraints() {
        addNavBar()
        addFirstLine()
        addTimeBarButtonItem()
        addMenuBarButtonItem()
        addTextDescription()
        addSecondLine()
        addBusinessInformationView()
        addThirdLine()
    }

    private func addNavBar() {
        navBar.height(100)
        navBar.alpha = 0.5
        navBar.edgesToSuperview(excluding: .bottom)
    }

    private func addFirstLine() {
        firstLine.leadingToSuperview()
        firstLine.trailingToSuperview()
        firstLine.topToBottom(of: navBar)
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
        textDescription.topToBottom(of: firstLine)
    }

    private func addSecondLine() {
        secondLine.leadingToSuperview()
        secondLine.trailingToSuperview()
        secondLine.topToBottom(of: textDescription)
    }

    private func addBusinessInformationView() {
        businessInformationView.height(400)
        businessInformationView.topToBottom(of: secondLine)
        businessInformationView.leadingToSuperview()
        businessInformationView.trailingToSuperview()
    }

    private func addThirdLine() {
        thirdLine.leadingToSuperview()
        thirdLine.trailingToSuperview()
        thirdLine.topToBottom(of: businessInformationView)
    }

    // MARK: - Configure
    private func configureLines(_ borders: [TinyView]) {
        for border in borders {
            border.alpha = 0.3
            border.height(1)
        }
    }
}
