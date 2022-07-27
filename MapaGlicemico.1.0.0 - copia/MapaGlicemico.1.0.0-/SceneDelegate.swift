//
//  SceneDelegate.swift
//  MapaGlicemico.1.0.0-
//
//  Created by Sarah dos Santos Silva on 27/07/22.
//

import UIKit
import CareKitUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let symptomTrackerVC = SymptomTrackerViewController(storeManager: CareStoreReferenceManager.shared.synchronizedStoreManager)
        
        let careViewController = UINavigationController(rootViewController: symptomTrackerVC)
        
        symptomTrackerVC.title = "Mapa Glicemico"
        symptomTrackerVC.tabBarItem = UITabBarItem(
            title: "Mapa Glicemico", image: UIImage(systemName: "heart.fill"), tag: 0)
        

        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = careViewController
            window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
            window?.makeKeyAndVisible()

    
        
        }
        
        let insights = InsightsViewController(storeManager: CareStoreReferenceManager.shared.synchronizedStoreManager)
        insights.title = "Gráficos"
        insights.tabBarItem = UITabBarItem(
            title: "Gráficos",
            image: UIImage(systemName: "waveform.path.ecg.rectangle.fill"),
            tag: 1
        )

        let root = UITabBarController()
        let feedTab = UINavigationController(rootViewController: symptomTrackerVC)
        let insightsTab = UINavigationController(rootViewController: insights)
        root.setViewControllers([feedTab, insightsTab], animated: false)

        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.rootViewController = root
        window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
        window?.makeKeyAndVisible()
    }


}

