//
//  AppTabBarViewController.swift
//  VHgram
//
//  Created by Владислав on 13.04.2022.
//

import UIKit

class AppTabBarViewController: UITabBarController {
    
    var chatsTableViewController: ChatsTableViewController = ChatsTableViewController()
    var contactsTableViewController: ContactsTableViewController = ContactsTableViewController()
    var settings = SettingsViewController()
    var profile = ProfileViewController()
    
    static func storyBoardInstance() -> AppTabBarViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AppTabBarViewController") as? AppTabBarViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatsTableViewController.viewDelegate = self
        settings.delegate = self
        self.setViewControllers([
            UINavigationController(rootViewController: chatsTableViewController),
            UINavigationController(rootViewController: contactsTableViewController),
            UINavigationController(rootViewController: profile),
            UINavigationController(rootViewController: settings)],
            animated: true)
        
        
        configureTabBar()
        
        configureTabBarItem(id: 0, imageSystemName: TabsSettings.chatsTabIcon, itemName: TabsSettings.chatsTabName)
        configureTabBarItem(id: 1, imageSystemName: TabsSettings.contactsTabIcon, itemName: TabsSettings.contactsTabName)
        configureTabBarItem(id: 2, imageSystemName: TabsSettings.profileTabIcon, itemName: TabsSettings.profileTabName)
        configureTabBarItem(id: 3, imageSystemName: TabsSettings.settingsTabIcon, itemName: TabsSettings.settingsTabName)
        
        self.loadView()
    }

    private func configureTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.shadowColor =  UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = Float(CustomSettings.shadowsOpacity)
        tabBar.layer.shadowRadius = CGFloat(CustomSettings.shadowsRadius)
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: CustomColors.red, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        /* to make it always white */
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
    private func configureTabBarItem(id: Int, imageSystemName: String, itemName: String) {
        let tabBarItem = self.tabBar.items?[id]
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        tabBarItem?.image = UIImage(systemName: imageSystemName, withConfiguration: configuration)
        let selectedFont = UIFont.systemFont(ofSize: 18)
        let selectConfiguration = UIImage.SymbolConfiguration(font: selectedFont)
        tabBarItem?.selectedImage = UIImage(systemName: imageSystemName, withConfiguration: selectConfiguration)
        tabBarItem?.title = itemName
    }
}

protocol AppTabBarViewControllerDelegate {
    func switchSignInController();
    func switchChatView();
}

extension AppTabBarViewController: AppTabBarViewControllerDelegate {
    func switchChatView() {
        let app = MessagesViewController.storyBoardInstance()
       if let app = app {
            view.insertSubview(app.view, at: 1)
            UIApplication.shared.keyWindow?.rootViewController = app
        }
    }
    
    func switchSignInController() {
        let app = LoginViewController.storyBoardInstance()
        if app != nil {
            self.view.insertSubview((app?.view)!, at: 1)
            UIApplication.shared.keyWindow?.rootViewController = app
        }
    }
}
