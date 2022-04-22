//
//  SlideCollectionViewCell.swift
//  VHgram
//
//  Created by Владислав on 10.04.2022.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    static let reuseId = "SlideCollectionViewCell"
    
    var delegate: LoginViewControllerDelegate?
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(_ sender: UIButton) {
        let login = self.email.text
        let password = self.password.text
        if (login != nil && password != nil) {
            AuthModel.loginDelegate = delegate
            AuthModel.signIn(login: login!, password: password!)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }

}