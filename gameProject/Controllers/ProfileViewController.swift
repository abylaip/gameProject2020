//
//  ProfileViewController.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

//import UIKit
//
//class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    @IBOutlet var scrollView: UIScrollView!
//    @IBOutlet var imageView: UIImageView!
//    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
//    @IBOutlet var imageTopConstraint: NSLayoutConstraint!
//    private var originalHeight: CGFloat!
//
//    private var blurEffectView: UIVisualEffectView!
//    private var animator: UIViewPropertyAnimator!
//
//    @IBOutlet var name: UILabel!
//    @IBOutlet var phone: UILabel!
//
//    @IBOutlet var upTableView: UITableView!
//    @IBOutlet var downTableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        createViews()
////
////        setViewConstraints()
//
//        self.view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9254901961, blue: 0.9568627451, alpha: 1)
//
//
//        upTableView.layer.cornerRadius = 15
//        downTableView.layer.cornerRadius = 15
//
//        name.layer.shadowColor = UIColor.black.cgColor
//        name.layer.shadowRadius = 3.0
//        name.layer.shadowOpacity = 1.0
//        name.layer.shadowOffset = CGSize(width: 4, height: 4)
//        name.layer.masksToBounds = false
//
//        phone.layer.shadowColor = UIColor.black.cgColor
//        phone.layer.shadowRadius = 3.0
//        phone.layer.shadowOpacity = 1.0
//        phone.layer.shadowOffset = CGSize(width: 4, height: 4)
//        phone.layer.masksToBounds = false
//
//
//        scrollView.contentInsetAdjustmentBehavior = .never
//        scrollView.delegate = self
//        originalHeight = 300
//
//        setupVisualEffectBlur()
//
//    }
//
//    private func setupVisualEffectBlur() {
//        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
//            guard let self = self else { return }
//
//            let blurEffect = UIBlurEffect(style: .regular)
//            self.blurEffectView = UIVisualEffectView(effect: blurEffect)
//            self.imageView.addSubview(self.blurEffectView)
//            self.setupConstraints()
//        })
//    }
//
//    private func setupConstraints() {
//        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
//        blurEffectView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
//        blurEffectView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
//        blurEffectView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
//        blurEffectView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView == upTableView{
//            if indexPath.row == 0 {
//                let cell = upTableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! upGameCell
//                return cell
//            } else {
//                let cell = upTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! upFavCell
//                return cell
//            }
//        } else if tableView == downTableView{
//            if indexPath.row == 0 {
//                let cell = downTableView.dequeueReusableCell(withIdentifier: "downArcCell", for: indexPath) as! downArcCell
//                return cell
//            } else if indexPath.row == 1{
//                let cell = downTableView.dequeueReusableCell(withIdentifier: "downSetCell", for: indexPath) as! downSetCell
//                return cell
//            } else {
//                let cell = downTableView.dequeueReusableCell(withIdentifier: "downHelCell", for: indexPath) as! downHelCell
//                return cell
//            }
//        }
//
//        return UITableViewCell()
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//}
//
//extension ProfileViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offset = scrollView.contentOffset.y
//        let defaultTop = CGFloat(0)
//        var currentTop = defaultTop
//
//        if scrollView == self.scrollView {
//            if offset < 0 {
//                currentTop = offset
//                imageHeightConstraint.constant = originalHeight - offset
//                animator.fractionComplete = abs(offset) / 100
//            } else {
//                imageHeightConstraint.constant = originalHeight
//                animator.fractionComplete = 0
//            }
//            imageTopConstraint.constant = currentTop
//        }
//    }
//}
