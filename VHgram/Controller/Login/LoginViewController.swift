//
//  LoginViewController.swift
//  VHgram
//
//  Created by Владислав on 10.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    static func storyBoardInstance() -> LoginViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }
    
    func configCollectionView() {
        
        self.navigationItem.title = "Login"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray

        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        collectionView.register(
            UINib(nibName: SlideCollectionViewCell.reuseId, bundle: nil),
            forCellWithReuseIdentifier: SlideCollectionViewCell.reuseId)
        collectionView.register(
            UINib(nibName: SignUpCollectionViewCell.reuseId, bundle: nil),
            forCellWithReuseIdentifier: SignUpCollectionViewCell.reuseId)
        
    }

}


extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.reuseId, for: indexPath) as! SlideCollectionViewCell
            cell.delegate = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpCollectionViewCell.reuseId, for: indexPath) as! SignUpCollectionViewCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
}

protocol LoginViewControllerDelegate {
    func switchAppController();
}

extension LoginViewController: LoginViewControllerDelegate {
    func switchAppController() {
        let app = AppTabBarViewController.storyBoardInstance()
        if app != nil {
            self.view.insertSubview((app?.view)!, at: 1)
            UIApplication.shared.keyWindow?.rootViewController = app
        }
    }
}
