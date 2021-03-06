//
//  SignUpCollectionViewCell.swift
//  VHgram
//
//  Created by Владислав on 22.04.2022.
//

import UIKit

class SignUpCollectionViewCell: UICollectionViewCell {

    static let reuseId = "SignUpCollectionViewCell"
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var verdict: UILabel!
    @IBOutlet weak var checkPassword: UITextField!
    
    @IBAction func SignUpNtnAct(_ sender: Any) {
        AuthModel.regLabelDelegate = verdict
        
        AuthModel.signUp(name: name.text!, lastName: lastName.text!, login: email.text!, password: password.text!, checkPassword: checkPassword.text!)
    }
    
    @IBOutlet weak var sugnUpBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.attributedPlaceholder = makeAttributedPlaceholder(text: SignUpPlaceholders.name)
        lastName.attributedPlaceholder = makeAttributedPlaceholder(text: SignUpPlaceholders.lastName)
        email.attributedPlaceholder = makeAttributedPlaceholder(text: SignUpPlaceholders.login)
        password.attributedPlaceholder = makeAttributedPlaceholder(text: SignUpPlaceholders.password)
        checkPassword.attributedPlaceholder = makeAttributedPlaceholder(text: SignUpPlaceholders.passwordConfirmation)
    }

}
