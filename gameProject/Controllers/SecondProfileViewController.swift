//
//  SecondProfileViewController.swift
//  gameProject
//
//  Created by Abyl on 8/21/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

final class SecondProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageTopConstraint: NSLayoutConstraint!
    private var originalHeight: CGFloat!
    
    private var blurEffectView: UIVisualEffectView!
    private var animator: UIViewPropertyAnimator!
    
    @IBOutlet var upTableView: UITableView!
    @IBOutlet var downTableView: UITableView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        upTableView.layer.cornerRadius = 15
        downTableView.layer.cornerRadius = 15
        
        nameLabel.layer.shadowColor = UIColor.black.cgColor
        nameLabel.layer.shadowRadius = 3.0
        nameLabel.layer.shadowOpacity = 1.0
        nameLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        nameLabel.layer.masksToBounds = false
        
        phoneNumber.layer.shadowColor = UIColor.black.cgColor
        phoneNumber.layer.shadowRadius = 3.0
        phoneNumber.layer.shadowOpacity = 1.0
        phoneNumber.layer.shadowOffset = CGSize(width: 4, height: 4)
        phoneNumber.layer.masksToBounds = false
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        originalHeight = 300
        
        setupVisualEffectBlur()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == upTableView{
            if indexPath.row == 0 {
                let cell = upTableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! upGameCell
                return cell
            } else {
                let cell = upTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! upFavCell
                return cell
            }
        } else if tableView == downTableView{
            if indexPath.row == 0 {
                let cell = downTableView.dequeueReusableCell(withIdentifier: "downArcCell", for: indexPath) as! downArcCell
                return cell
            } else if indexPath.row == 1{
                let cell = downTableView.dequeueReusableCell(withIdentifier: "downSetCell", for: indexPath) as! downSetCell
                return cell
            } else {
                let cell = downTableView.dequeueReusableCell(withIdentifier: "downHelCell", for: indexPath) as! downHelCell
                return cell
            }
        }

        return UITableViewCell()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    private func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            guard let self = self else { return }
            
            let blurEffect = UIBlurEffect(style: .regular)
            self.blurEffectView = UIVisualEffectView(effect: blurEffect)
            self.imageView.addSubview(self.blurEffectView)
            self.setupConstraints()
        })
    }
    
    private func setupConstraints() {
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        blurEffectView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        blurEffectView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    @IBAction func didLogOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignInViewController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .flipHorizontal
                
        present(secondVC, animated: true, completion: nil)
    }
    
}

extension SecondProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let defaultTop = CGFloat(0)
        var currentTop = defaultTop
        
        if scrollView == self.scrollView {
            if offset < 0 {
                currentTop = offset
                imageHeightConstraint.constant = originalHeight - offset
                //animator.fractionComplete = abs(offset) / 100
            } else {
                imageHeightConstraint.constant = originalHeight
                //animator.fractionComplete = 0
            }
            imageTopConstraint.constant = currentTop
        }
    }
}
